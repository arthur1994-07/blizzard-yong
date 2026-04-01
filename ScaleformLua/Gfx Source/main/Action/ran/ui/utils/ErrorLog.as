package ran.ui.utils
{
    import flash.external.*;

    public class ErrorLog extends Object
    {
        public static const TYPE_SETPROPERTY:int = 0;
        public static const TYPE_SETEVENT:int = 1;
        public static const TYPE_WIDGETID:int = 2;
        public static const TYPE_GETPROPERTY:int = 3;
        public static const TYPE_SETDATAPROVIDER:int = 4;
        public static const TYPE_CALLFUNCTION:int = 5;
        public static const TYPE_REMOVEDATAPROVIDER:int = 6;
        public static const TYPE_GETDATAPROVIDER:int = 7;
        public static const TYPE_SETSTAGEEVENT:int = 8;
        public static const TYPE_SETFOCUS:int = 9;
        public static const TYPE_SETTEXTFORMAT:int = 10;
        public static const TYPE_LISTITEMPROP:int = 11;
        public static const TYPE_SETTWEEN:int = 12;
        public static const TYPE_HITTESTENABLE:int = 13;
        public static const TYPE_SETDATAPROVIDERPROP:int = 14;
        public static const TYPE_SETSPEECHBUBBLE:int = 15;
        public static const TYPE_SNAPCHECK:int = 16;
        public static const LOG_INSTANCE:int = 0;
        public static const LOG_ARGS_COUNT:int = 1;
        public static const LOG_UNDEFINED_PROPERTY:int = 2;
        public static const LOG_EVENT:int = 3;
        public static const LOG_CALLBACK:int = 4;
        public static const LOG_NOT_LOADED:int = 5;
        public static const LOG_INCORRECT_WIDGETID:int = 6;
        public static const LOG_ITEM_COUNT:int = 7;
        public static var arrLog:Array = [];

        public function ErrorLog()
        {
            return;
        }// end function

        public static function ResetLog() : void
        {
            arrLog = [];
            return;
        }// end function

        public static function PushLog(param1:Object) : void
        {
            arrLog.push(param1);
            return;
        }// end function

        public static function PrintErrorLog(param1:int, param2:int, param3:int) : void
        {
            var _loc_4:* = "Error(widgetID = " + param1 + ") ";
            switch(param2)
            {
                case TYPE_SETPROPERTY:
                {
                    _loc_4 = _loc_4 + "SetProperty : ";
                    break;
                }
                case TYPE_SETEVENT:
                {
                    _loc_4 = _loc_4 + "SetEvent : ";
                    break;
                }
                case TYPE_WIDGETID:
                {
                    _loc_4 = _loc_4 + "WidgetsList : ";
                    break;
                }
                case TYPE_GETPROPERTY:
                {
                    _loc_4 = _loc_4 + "GetProperty : ";
                    break;
                }
                case TYPE_SETDATAPROVIDER:
                {
                    _loc_4 = _loc_4 + "SetDataProvider : ";
                    break;
                }
                case TYPE_CALLFUNCTION:
                {
                    _loc_4 = _loc_4 + "CallFunction : ";
                    break;
                }
                case TYPE_REMOVEDATAPROVIDER:
                {
                    _loc_4 = _loc_4 + "RemoveDataProvider : ";
                    break;
                }
                case TYPE_GETDATAPROVIDER:
                {
                    _loc_4 = _loc_4 + "GetDataProvider : ";
                    break;
                }
                case TYPE_SETSTAGEEVENT:
                {
                    _loc_4 = _loc_4 + "SetStageEvent : ";
                    break;
                }
                case TYPE_SETFOCUS:
                {
                    _loc_4 = _loc_4 + "SetFocus : ";
                    break;
                }
                case TYPE_SETTEXTFORMAT:
                {
                    _loc_4 = _loc_4 + "SetTextFormat : ";
                    break;
                }
                case TYPE_LISTITEMPROP:
                {
                    _loc_4 = _loc_4 + "SetListItemProperty : ";
                    break;
                }
                case TYPE_SETTWEEN:
                {
                    _loc_4 = _loc_4 + "SetTween : ";
                    break;
                }
                case TYPE_HITTESTENABLE:
                {
                    _loc_4 = _loc_4 + "HitTestEnable : ";
                    break;
                }
                case TYPE_SETDATAPROVIDERPROP:
                {
                    _loc_4 = _loc_4 + "SetDataProviderProp : ";
                    break;
                }
                case TYPE_SETSPEECHBUBBLE:
                {
                    _loc_4 = _loc_4 + "SetSpeechBubble : ";
                    break;
                }
                case TYPE_SNAPCHECK:
                {
                    _loc_4 = _loc_4 + "SnapCheck : ";
                    break;
                }
                default:
                {
                    return;
                    break;
                }
            }
            switch(param3)
            {
                case LOG_INSTANCE:
                {
                    _loc_4 = _loc_4 + ("[" + arrLog[0] + "] Can not find");
                    break;
                }
                case LOG_ARGS_COUNT:
                {
                    _loc_4 = _loc_4 + "args Count = 0";
                    break;
                }
                case LOG_UNDEFINED_PROPERTY:
                {
                    _loc_4 = _loc_4 + ("[" + arrLog[0] + "] Undefined Property");
                    break;
                }
                case LOG_EVENT:
                {
                    _loc_4 = _loc_4 + "Undefined Event";
                    break;
                }
                case LOG_CALLBACK:
                {
                    _loc_4 = _loc_4 + "Undefined CallBack";
                    break;
                }
                case LOG_NOT_LOADED:
                {
                    _loc_4 = _loc_4 + "Not loaded UI";
                    break;
                }
                case LOG_INCORRECT_WIDGETID:
                {
                    _loc_4 = _loc_4 + "Incorrect WidgetID";
                    break;
                }
                case LOG_ITEM_COUNT:
                {
                    _loc_4 = _loc_4 + ("Wrong Item Index [" + arrLog[0] + "]");
                    break;
                }
                default:
                {
                    break;
                }
            }
            ExternalInterface.call("OnPrintDebug", _loc_4, 1);
            ResetLog();
            return;
        }// end function

    }
}
