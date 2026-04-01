package ran.ui.managers
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import ran.ui.*;
    import ran.ui.core.*;
    import ran.ui.utils.*;

    public class WindowManager extends Object
    {
        static var _stage:Stage;
        static var _maxWindows:uint = 1;
        static var _openWindows:Array;

        public function WindowManager()
        {
            return;
        }// end function

        public static function init(param1:Stage) : void
        {
            WindowManager._stage = param1;
            WindowManager._openWindows = [];
            return;
        }// end function

        public static function showModal(param1:Sprite, param2:Sprite = null, param3:uint = 0) : void
        {
            return;
        }// end function

        public static function closeWindowByRef(param1:MWindow, param2:Boolean, param3:int) : Boolean
        {
            var _loc_4:* = 0;
            while (_loc_4 < _openWindows.length)
            {
                
                if (_openWindows[_loc_4] == param1)
                {
                    _openWindows.splice(_loc_4, 1);
                    return true;
                }
                _loc_4 = _loc_4 + 1;
            }
            return false;
        }// end function

        public static function getNumWindowsOpen() : uint
        {
            return _openWindows.length;
        }// end function

        public static function spawnWindow(param1:IUICoreInterface, param2:uint, param3:int, param4:String, param5:String, param6:String, param7:int, param8:int, param9:Boolean) : MWindow
        {
            var _loc_10:* = new WindowLoader();
            var _loc_11:* = new URLRequest(param5);
            var _loc_12:* = new LoaderContext(false, null);
            _loc_10.coreInterface = param1;
            _loc_10.xcoord = param7;
            _loc_10.ycoord = param8;
            _loc_10.widgetID = param2;
            _loc_10.subID = param3;
            _loc_10.title = param6;
            _loc_10.source = param4;
            _loc_10.isPreload = param9;
            _loc_10.contentLoaderInfo.addEventListener(Event.COMPLETE, onWindowLoadComplete, false, 0, true);
            _loc_10.load(_loc_11, _loc_12);
            return null;
        }// end function

        public static function onWindowLoadComplete(event:Event) : void
        {
            var _loc_2:* = event.target.loader as WindowLoader;
            var _loc_3:* = _loc_2.content as MWindow;
            _loc_2.removeChild(_loc_3);
            _loc_3.coreInterface = _loc_2.coreInterface;
            _loc_3.x = _loc_2.xcoord;
            _loc_3.y = _loc_2.ycoord;
            _loc_3.minWidth = 50;
            _loc_3.minHeight = 50;
            _loc_3.widgetID = _loc_2.widgetID;
            _loc_3.subID = _loc_2.subID;
            _loc_3.title = _loc_2.title;
            _loc_3.source = _loc_2.source;
            _loc_3.isPreload = _loc_2.isPreload;
            _loc_3.stageRef = WindowManager._stage;
            _loc_3.validateNow();
            _openWindows.push(_loc_3);
            return;
        }// end function

    }
}
