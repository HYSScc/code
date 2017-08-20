<?php
namespace  CustomBundle\Extensions\DataTag;

use \AppBundle\Extensions\DataTag\BaseDataTag;
use AppBundle\Extensions\DataTag\DataTag;

class MeetingRoomDataTag  extends BaseDataTag implements DataTag
{
    public function getData(array $arguments)
    {
//        if (!isset($arguments['meetingRoomId'])) {
//            throw new \InvalidArgumentException($this->getServiceKernel()->trans('meetingRoomId参数缺失'));
//        }

        return $this->getMeetingRoomService()->getMeetingRoom($arguments['meetingRoomId']);
    }

    protected function getMeetingRoomService()
    {
        return $this->getServiceKernel()->createService('CustomBundle:Meeting:MeetingRoomService');
    }
}