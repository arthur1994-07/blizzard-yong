package ran.ui.events
{
    import flash.events.*;

    public class WidgetEvent extends Event
    {
        public var widgetID:int;
        public var subID:int = 0;
        public var isDelete:Boolean = false;
        public static const OPEN_WIDGET:String = "openWidget";
        public static const CLOSE_WIDGET:String = "closeWidget";

        public function WidgetEvent(param1:String, param2:Boolean = true, param3:Boolean = true, param4:int = -1, param5:int = 0, param6 = false)
        {
            super(param1, param2, param3);
            this.widgetID = param4;
            this.subID = param5;
            this.isDelete = param6;
            return;
        }// end function

    }
}
