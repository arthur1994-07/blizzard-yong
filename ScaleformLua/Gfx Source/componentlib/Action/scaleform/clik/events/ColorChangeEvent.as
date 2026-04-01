package scaleform.clik.events
{
    import flash.events.*;

    public class ColorChangeEvent extends Event
    {
        public var value:uint = 0;
        public var strValue:String;
        public static const COLOR_CHANGE:String = "colorChangeEvent";

        public function ColorChangeEvent(param1:String, param2:uint, param3:Boolean = false, param4:Boolean = false)
        {
            super(param1, param3, param4);
            this.value = param2;
            this.strValue = param2.toString();
            return;
        }// end function

    }
}
