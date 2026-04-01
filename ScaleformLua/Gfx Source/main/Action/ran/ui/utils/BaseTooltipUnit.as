package ran.ui.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import ran.ui.*;

    public class BaseTooltipUnit extends Object
    {
        protected var _tooltipRef:MovieClip;
        protected var _childTooltipArr:Array;
        protected var _tooltipType:int = 0;
        protected var SLOT_BINDING:String = "";
        protected var _stage:Stage;
        protected var _minTooltipWidth:int = 200;
        protected var _maxTooltipWidth:int = 400;
        public var tooltipClassName:String = "Tooltip";
        public static const BASIC_TOOLTIP:int = 0;
        public static const SKILL_SUB_TOOLTIP:int = 1;
        public static const ITEM_SUB_TOOLTIP:int = 2;
        public static const REBUILD_SUB_TOOLTIP:int = 3;
        public static const SLOT_TOOLTIP_ID:String = "TOOLTIP_SLOT";
        public static const SLOT_TOOLTIP_ID_DISGUISE:String = "TOOLTIP_SLOT_DISGUISE_SKILL";
        public static const SLOT_TOOLTIP_ID_MULTISKILL:String = "TOOLTIP_SLOT_MULTISKILL";
        public static const SLOT_TOOLTIP_ID_LINKSKILL:String = "TOOLTIP_SLOT_LINKSKILL";
        public static const SLOT_TOOLTIP_ID_DELAYSKILL:String = "TOOLTIP_SLOT_DELAYSKILL";
        public static const SLOT_TOOLTIP_ID_BOOST:String = "TOOLTIP_SLOT_ITEMBOOST";
        public static const SLOT_TOOLTIP_ID_ACTIVE:String = "TOOLTIP_SLOT_ACTIVE_SKILL";
        public static const SLOT_TOOLTIP_COMPARE_ID:String = "TOOLTIP_SLOT_COMPARE";
        static const ADD_SLOT_BINDING:String = "TOOLTIP_ADD_SLOT";
        static const ADD_SLOT_COUNT:int = 30;
        static const TRADE_SLOT_COUNT:int = 10;

        public function BaseTooltipUnit() : void
        {
            this._childTooltipArr = new Array();
            if (DataAdapter.getMinTooltipWidth != null)
            {
                this._minTooltipWidth = DataAdapter.getMinTooltipWidth();
            }
            if (DataAdapter.getMaxTooltipWidth != null)
            {
                this._maxTooltipWidth = DataAdapter.getMaxTooltipWidth();
            }
            return;
        }// end function

        public function GetSlotBinding() : String
        {
            return this.SLOT_BINDING;
        }// end function

        public function get tooltipRef() : MovieClip
        {
            return this._tooltipRef;
        }// end function

        public function get x() : int
        {
            return this._tooltipRef.x;
        }// end function

        public function set x(param1:int) : void
        {
            this._tooltipRef.x = param1;
            return;
        }// end function

        public function get y() : int
        {
            return this._tooltipRef.y;
        }// end function

        public function set y(param1:int) : void
        {
            this._tooltipRef.y = param1;
            return;
        }// end function

        public function get TooltipPos() : Point
        {
            var _loc_1:* = new Point();
            _loc_1.x = this._tooltipRef.x;
            _loc_1.y = this._tooltipRef.y;
            return _loc_1;
        }// end function

        public function get TooltipSize() : Point
        {
            var _loc_1:* = this._tooltipRef["bg"] as MovieClip;
            var _loc_2:* = new Point();
            _loc_2.x = _loc_1.width;
            _loc_2.y = _loc_1.height;
            return _loc_2;
        }// end function

        protected function RemoveFromSprite(param1:Sprite) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            if (this._tooltipRef != null)
            {
                param1.removeChild(this._tooltipRef);
            }
            if (this._childTooltipArr != null)
            {
                _loc_2 = 0;
                while (_loc_2 < this._childTooltipArr.length)
                {
                    
                    if (this._childTooltipArr[_loc_2] != null)
                    {
                        _loc_3 = this._childTooltipArr[_loc_2] as BaseTooltipUnit;
                        if (_loc_3 != null)
                        {
                            _loc_3.RemoveFromSprite(param1);
                        }
                    }
                    _loc_2++;
                }
            }
            return;
        }// end function

        public function HideTooltip(param1:Sprite) : void
        {
            this.RemoveFromSprite(param1);
            this.ClearChildTooltipUnit();
            return;
        }// end function

        protected function ClearChildTooltipUnit() : void
        {
            var _loc_1:* = null;
            if (this._childTooltipArr)
            {
                while (this._childTooltipArr.length != 0)
                {
                    
                    _loc_1 = this._childTooltipArr.pop();
                    _loc_1.ClearChildTooltipUnit();
                }
            }
            return;
        }// end function

        protected function PushChildTooltip(param1:BaseTooltipUnit) : BaseTooltipUnit
        {
            var _loc_2:* = this._childTooltipArr.push(param1);
            return this._childTooltipArr[(_loc_2 - 1)];
        }// end function

        protected function setupTooltipLocation(param1:Number, param2:Number, param3:Point, param4:Point) : void
        {
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            _loc_5 = param3.x - param1;
            if (_loc_5 < 0)
            {
                _loc_5 = param4.x;
            }
            _loc_6 = param3.y - param2;
            if (_loc_6 < 0)
            {
                _loc_6 = param4.y;
            }
            if (this._stage.stageHeight < _loc_6 + param2)
            {
                _loc_6 = this._stage.stageHeight - param2;
            }
            this._tooltipRef.x = _loc_5;
            this._tooltipRef.y = _loc_6;
            return;
        }// end function

        protected function ConstructTooltip(param1:Object) : void
        {
            return;
        }// end function

        public function forceRectConfigure(param1:Number, param2:Number, param3:Number) : void
        {
            return;
        }// end function

        public function showTooltip(event:MouseEvent, param2:Sprite, param3:Stage, param4:Object) : void
        {
            return;
        }// end function

        protected function pushTypeText_HTMLText(param1:String) : void
        {
            var _loc_2:* = "<font color=\"#00B4FF\">" + param1 + "</font>";
            var _loc_3:* = this._tooltipRef["tfType"];
            _loc_3.htmlText = _loc_2;
            return;
        }// end function

    }
}
