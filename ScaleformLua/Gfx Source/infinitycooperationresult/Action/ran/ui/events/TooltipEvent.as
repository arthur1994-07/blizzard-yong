package ran.ui.events
{
    import flash.events.*;
    import scaleform.clik.core.*;

    public class TooltipEvent extends Event
    {
        public var elem:UIComponent;
        public static const REGISTER_ELEMENT:String = "tooltipRegister";
        public static const UNREGISTER_ELEMENT:String = "tooltipUnregister";

        public function TooltipEvent(param1:String, param2:Boolean = true, param3:Boolean = false, param4:UIComponent = null)
        {
            super(param1, param2, param3);
            this.elem = param4;
            return;
        }// end function

    }
}
