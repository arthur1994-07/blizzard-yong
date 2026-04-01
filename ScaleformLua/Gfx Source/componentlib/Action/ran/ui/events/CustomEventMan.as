package ran.ui.events
{
    import flash.display.*;
    import flash.utils.*;

    public class CustomEventMan extends Object
    {
        private static var Container:Dictionary;
        private static var stageInst:Stage;

        public function CustomEventMan()
        {
            return;
        }// end function

        public static function Init(param1:Stage) : void
        {
            Container = new Dictionary(true);
            stageInst = param1;
            return;
        }// end function

        public static function RegEvent(param1:DisplayObject, param2:Object, param3:String, param4:String, param5:Array, param6:Array) : void
        {
            var _loc_7:* = FindEvent(param1, param2, param3);
            if (_loc_7 == null)
            {
                _loc_7 = new CustomEvent();
                if (Container[param1] == null)
                {
                    Container[param1] = new Dictionary(true);
                }
                if (Container[param1][param2] == null)
                {
                    Container[param1][param2] = new Array();
                }
                Container[param1][param2].push(_loc_7);
            }
            _loc_7.RegEvent(param2, param3, param4, param5, param6);
            return;
        }// end function

        private static function FindEvent(param1:DisplayObject, param2:Object, param3:String) : CustomEvent
        {
            var _loc_7:* = 0;
            var _loc_8:* = null;
            var _loc_4:* = Container[param1];
            if (_loc_4 == null)
            {
                return null;
            }
            var _loc_5:* = _loc_4[param2];
            if (_loc_5 == null)
            {
                return null;
            }
            var _loc_6:* = _loc_5.length;
            while (_loc_7 < _loc_6)
            {
                
                _loc_8 = _loc_5[_loc_7] as CustomEvent;
                if (_loc_8.instObj == param2 && _loc_8.event == param3)
                {
                    return _loc_8;
                }
                _loc_7 = _loc_7 + 1;
            }
            return null;
        }// end function

        public static function RemoveEvent(param1:DisplayObject, param2:Object) : void
        {
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_3:* = Container[param1];
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3[param2];
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.length;
            while (_loc_6 < _loc_5)
            {
                
                _loc_7 = _loc_4[_loc_6] as CustomEvent;
                _loc_7.RemoveEvent();
                _loc_6 = _loc_6 + 1;
            }
            _loc_3[param2] = null;
            delete _loc_3[param2];
            return;
        }// end function

        public static function RemoveEventRoot(param1:MovieClip) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_2:* = Container[param1];
            if (_loc_2 == null)
            {
                return;
            }
            if (_loc_2[param1] != null)
            {
                _loc_3 = _loc_2[param1];
                _loc_4 = _loc_3.length;
                _loc_5 = 0;
                while (_loc_5 < _loc_4)
                {
                    
                    _loc_6 = _loc_3[_loc_5] as CustomEvent;
                    if (_loc_6.event == WidgetEvent.CLOSE_WIDGET)
                    {
                        _loc_6.handleCustomEvent(new WidgetEvent(WidgetEvent.CLOSE_WIDGET));
                        break;
                    }
                    _loc_5++;
                }
            }
            Container[param1] = null;
            delete Container[param1];
            return;
        }// end function

        public static function TraceCount() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = null;
            trace("-------------------------------------------------");
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            for (_loc_3 in Container)
            {
                
                _loc_4 = _loc_10[_loc_3];
                for (_loc_5 in _loc_4)
                {
                    
                    _loc_1 = _loc_1 + 1;
                    _loc_6 = _loc_4[_loc_5];
                    _loc_2 = _loc_6.length;
                    _loc_7 = 0;
                    while (_loc_7 < _loc_2)
                    {
                        
                        _loc_8 = _loc_6[_loc_7] as CustomEvent;
                        trace("callBack : " + _loc_8.callBack);
                        _loc_7++;
                    }
                    trace("Array : " + _loc_2 + " ----------------------");
                }
            }
            trace("Container : " + _loc_1);
            trace("-------------------------------------------------");
            return;
        }// end function

    }
}
