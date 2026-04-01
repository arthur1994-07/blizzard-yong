package ran.ui.utils
{
    import flash.display.*;

    public class WidgetLoader extends Loader
    {
        public var xcoord:int = 0;
        public var ycoord:int = 0;
        public var widgetID:int;
        public var subID:int = -1;
        public var isPreload:Boolean = false;

        public function WidgetLoader()
        {
            return;
        }// end function

    }
}
