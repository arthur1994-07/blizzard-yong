package scaleform.clik.events
{
    import flash.display.*;
    import flash.events.*;

    public class SimpleTooltipEvent extends Event
    {
        public var component:InteractiveObject = null;
        public var localX:int = 0;
        public var localY:int = 0;
        public var tooltip:String = "";
        public var removeUI:Boolean = false;
        public var htmlText:Boolean = false;
        public static const OPEN:String = "tooltipOpen";
        public static const CLOSE:String = "tooltipClose";

        public function SimpleTooltipEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
