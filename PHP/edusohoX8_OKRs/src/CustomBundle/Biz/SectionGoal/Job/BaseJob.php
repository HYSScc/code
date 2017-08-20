<?php

namespace CustomBundle\Biz\SectionGoal\Job;

use Biz\Crontab\Service\CrontabService;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use Symfony\Component\Yaml\Yaml;
use Topxia\Service\Common\ServiceKernel;

class BaseJob
{
    protected $logger;

    protected function getLogger()
    {
        if ($this->logger) {
            return $this->logger;
        }
        $biz = $this->getServiceKernel()->getBiz();
        $logger = new Logger('Job');
        $logger->pushHandler(new StreamHandler("{$biz['log_directory']}/OKRs_data.log", Logger::DEBUG));
        $this->logger = $logger;

        return $logger;
    }

    public function getNextExecutedTime()
    {
        $filePath = $this->getCrontabConfigYml();
        $yaml = new Yaml();

        if (!file_exists($filePath)) {
            $content = $yaml->dump(array('crontab_next_executed_time' => 0));
            $fh = fopen($filePath, 'w');
            fwrite($fh, $content);
            fclose($fh);
        }

        $fileContent = file_get_contents($filePath);
        $config = $yaml->parse($fileContent);

        return $config['crontab_next_executed_time'];
    }

    public function setNextExecutedTime($nextExecutedTime)
    {
        $filePath = $this->getCrontabConfigYml();
        $yaml = new Yaml();
        $content = $yaml->dump(array('crontab_next_executed_time' => $nextExecutedTime));
        $fh = fopen($filePath, 'w');
        fwrite($fh, $content);
        fclose($fh);
    }

    private function getCrontabConfigYml()
    {
        return $this->getServiceKernel()->getParameter('kernel.root_dir').'/../app/data/OKRs_crontab_config.yml';
    }

    protected function createService($alias)
    {
        return $this->getServiceKernel()->getBiz()->service($alias);
    }

    protected function getServiceKernel()
    {
        return ServiceKernel::instance();
    }

    /**
     * @return CrontabService
     */
    protected function getCrontabService()
    {
        return $this->getServiceKernel()->createService('Crontab:CrontabService');
    }
}
