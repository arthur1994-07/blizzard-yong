package scaleform.clik.events
{
    import flash.events.*;

    public class SliderEvent extends Event
    {
        public var value:Number = -1;
        public static const VALUE_CHANGE:String = "valueChange";

        public function SliderEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:Number = -1)
        {
            super(param1, param2, param3);
            this.value = param4;
            return;
        }// end function

        override public function clone() : Event
        {
            return new SliderEvent(type, bubbles, cancelable, this.value);
        }// end function

        override public function toString() : String
        {
            return formatToString("SliderEvent", "type", "bubbles", "cancelable", "value");
        }// end function

    }
}
