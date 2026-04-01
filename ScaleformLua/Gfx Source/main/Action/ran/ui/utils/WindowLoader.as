package ran.ui.utils
{
    import flash.display.*;
    import ran.ui.*;

    public class WindowLoader extends Loader
    {
        public var coreInterface:IUICoreInterface;
        public var xcoord:int;
        public var ycoord:int;
        public var title:String;
        public var widgetID:int;
        public var subID:int;
        public var source:String;
        public var isPreload:Boolean;

        public function WindowLoader()
        {
            return;
        }// end function

    }
}
