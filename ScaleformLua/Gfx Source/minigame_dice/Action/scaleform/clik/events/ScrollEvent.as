package scaleform.clik.events
{
    import flash.events.*;

    public class ScrollEvent extends Event
    {
        public var delta:int;
        public static const SCROLL_EVENT:String = "scrollEvent";

        public function ScrollEvent(param1:String, param2:Boolean = true, param3:Boolean = false, param4:int = 0) : void
        {
            super(param1, param2, param3);
            this.delta = param4;
            return;
        }// end function

    }
}
