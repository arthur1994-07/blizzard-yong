package ran.ui.utils
{
    import flash.display.*;
    import ran.ui.core.*;

    public class Aligner extends Object
    {
        public static var ALIGN_NONE:int = 0;
        public static var ALIGN_TOP_CENTER:int = 1;
        public static var ALIGN_TOP_LEFT:int = 2;
        public static var ALIGN_TOP_RIGHT:int = 3;
        public static var ALIGN_MIDDLE_CNETER:int = 4;
        public static var ALIGN_MIDDLE_LEFT:int = 5;
        public static var ALIGN_MIDDLE_RIGHT:int = 6;
        public static var ALIGN_BOTTOM_CENTER:int = 7;
        public static var ALIGN_BOTTOM_LEFT:int = 8;
        public static var ALIGN_BOTTOM_RIGHT:int = 9;
        public static var _stage:Stage;
        public static var _PrevStageWidth:int = 0;
        public static var _PrevStageHeight:int = 0;

        public function Aligner()
        {
            return;
        }// end function

        public static function WidgetAlign(param1:MovieClip, param2:int, param3:int, param4:int) : void
        {
            var _loc_9:* = 0;
            var _loc_10:* = null;
            if (param1 == null)
            {
                return;
            }
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            if (param1 is MWindow)
            {
                _loc_5 = param1.width;
                _loc_6 = param1.height;
            }
            else
            {
                _loc_9 = 0;
                while (_loc_9 < param1.numChildren)
                {
                    
                    _loc_10 = param1.getChildAt(_loc_9);
                    if (_loc_10.width > _loc_5)
                    {
                        _loc_5 = _loc_10.width;
                    }
                    if (_loc_10.height > _loc_6)
                    {
                        _loc_6 = _loc_10.height;
                    }
                    if (_loc_10.x < 0 && _loc_7 > _loc_10.x)
                    {
                        _loc_7 = _loc_10.x;
                    }
                    if (_loc_10.y < 0 && _loc_8 > _loc_10.y)
                    {
                        _loc_8 = _loc_10.y;
                    }
                    _loc_9++;
                }
                _loc_7 = _loc_7 * -1;
                _loc_8 = _loc_8 * -1;
            }
            switch(param2)
            {
                case ALIGN_NONE:
                {
                    param1.x = param1.x * _stage.stageWidth / _PrevStageWidth;
                    param1.y = param1.y * _stage.stageHeight / _PrevStageHeight;
                    _loc_7 = 0;
                    _loc_8 = 0;
                    break;
                }
                case ALIGN_TOP_CENTER:
                {
                    param1.x = (_stage.stageWidth - _loc_5) / 2;
                    param1.y = _loc_8;
                    _loc_7 = 0;
                    break;
                }
                case ALIGN_TOP_LEFT:
                {
                    param1.x = _loc_7;
                    param1.y = _loc_8;
                    break;
                }
                case ALIGN_TOP_RIGHT:
                {
                    param1.x = _stage.stageWidth - _loc_5;
                    param1.y = _loc_8;
                    _loc_7 = 0;
                    break;
                }
                case ALIGN_MIDDLE_CNETER:
                {
                    param1.x = (_stage.stageWidth - _loc_5) / 2;
                    param1.y = (_stage.stageHeight - _loc_6) / 2;
                    _loc_7 = 0;
                    _loc_8 = 0;
                    break;
                }
                case ALIGN_MIDDLE_LEFT:
                {
                    param1.x = _loc_7;
                    param1.y = (_stage.stageHeight - _loc_6) / 2;
                    _loc_7 = 0;
                    break;
                }
                case ALIGN_MIDDLE_RIGHT:
                {
                    param1.x = _stage.stageWidth - _loc_5;
                    param1.y = (_stage.stageHeight - _loc_6) / 2;
                    _loc_7 = 0;
                    _loc_8 = 0;
                    break;
                }
                case ALIGN_BOTTOM_CENTER:
                {
                    param1.x = (_stage.stageWidth - _loc_5) / 2;
                    param1.y = _stage.stageHeight - _loc_6 + _loc_8;
                    _loc_7 = 0;
                    break;
                }
                case ALIGN_BOTTOM_LEFT:
                {
                    param1.x = _loc_7;
                    param1.y = _stage.stageHeight - _loc_6 + _loc_8;
                    break;
                }
                case ALIGN_BOTTOM_RIGHT:
                {
                    param1.x = _stage.stageWidth - _loc_5;
                    param1.y = _stage.stageHeight - _loc_6 + _loc_8;
                    _loc_7 = 0;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (param2 != ALIGN_NONE)
            {
                param1.x = param1.x + param3;
                param1.y = param1.y + param4;
            }
            if (_stage.stageWidth < param1.x + _loc_5)
            {
                param1.x = _stage.stageWidth - _loc_5 + _loc_7;
            }
            if (param1.x < 0)
            {
                param1.x = _loc_7;
            }
            if (_stage.stageHeight < param1.y + _loc_6)
            {
                param1.y = _stage.stageHeight - _loc_6 + _loc_8;
            }
            if (param1.y < 0)
            {
                param1.y = _loc_8;
            }
            param1.x = Math.floor(param1.x);
            param1.y = Math.floor(param1.y);
            return;
        }// end function

    }
}
