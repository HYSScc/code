<?php
namespace  CustomBundle\Extensions\DataTag;

use \AppBundle\Extensions\DataTag\BaseDataTag;
use AppBundle\Extensions\DataTag\DataTag;

class MeetingRecordDataTag  extends BaseDataTag implements DataTag
{
    public function getData(array $arguments)
    {
        if (!isset($arguments['recordId'])) {
            throw new \InvalidArgumentException($this->getServiceKernel()->trans('recordId参数缺失'));
        }

        return $this->getMeetingRecordService()->getMeetingRecord($arguments['recordId']);
    }

    protected function getMeetingRecordService()
    {
        return $this->getServiceKernel()->createService('CustomBundle:Meeting:MeetingRecordService');
    }
}