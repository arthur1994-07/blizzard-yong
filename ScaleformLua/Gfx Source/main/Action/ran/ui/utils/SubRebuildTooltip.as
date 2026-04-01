package ran.ui.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;
    import scaleform.gfx.*;

    public class SubRebuildTooltip extends BaseTooltipUnit
    {
        protected var _minRebuildTooltipWidth:int = 200;
        protected var _maxRebuildTooltipWidth:int = 700;

        public function SubRebuildTooltip()
        {
            _tooltipType = BaseTooltipUnit.REBUILD_SUB_TOOLTIP;
            tooltipClassName = "TooltipRebuild";
            return;
        }// end function

        override protected function ConstructTooltip(param1:Object) : void
        {
            var _loc_11:* = null;
            var _loc_2:* = param1["canvas"] as Sprite;
            var _loc_3:* = param1["tooltip"];
            if (_tooltipRef == null)
            {
                _loc_11 = getDefinitionByName(tooltipClassName) as Class;
                if (_loc_11 == null)
                {
                    return;
                }
                _tooltipRef = new _loc_11 as MovieClip;
            }
            _loc_2.addChild(_tooltipRef);
            var _loc_4:* = _tooltipRef["textField"];
            _loc_4.wordWrap = false;
            _loc_4.htmlText = _loc_3;
            var _loc_5:* = _loc_4.textWidth + 10;
            if (_loc_4.textWidth + 10 > this._maxRebuildTooltipWidth)
            {
                _loc_5 = this._maxRebuildTooltipWidth;
                _loc_4.wordWrap = true;
            }
            _loc_4.width = _loc_5;
            _loc_4.height = _loc_4.textHeight + 10;
            var _loc_6:* = _tooltipRef["bg"];
            _loc_6.width = _loc_5 + 10;
            _loc_6.height = _loc_4.height + 10;
            var _loc_7:* = _loc_6.width;
            var _loc_8:* = _loc_6.height;
            var _loc_9:* = new Point(0, 0);
            var _loc_10:* = new Point(_loc_9.x + _loc_7, _loc_9.y + _loc_8);
            this.setupTooltipLocation(_loc_7, _loc_8, _loc_9, _loc_10);
            InteractiveObjectEx.setHitTestDisable(_tooltipRef, true);
            return;
        }// end function

        override public function forceRectConfigure(param1:Number, param2:Number, param3:Number) : void
        {
            var _loc_4:* = _tooltipRef["textField"];
            var _loc_5:* = _tooltipRef["bg"];
            var _loc_6:* = Math.max(this._minRebuildTooltipWidth, param3 - 10);
            if (Math.max(this._minRebuildTooltipWidth, param3 - 10) > this._maxRebuildTooltipWidth)
            {
                _loc_6 = this._maxRebuildTooltipWidth;
                _loc_4.wordWrap = true;
            }
            _loc_4.width = _loc_6;
            _loc_5.width = _loc_6 + 10;
            var _loc_7:* = _loc_5.width;
            var _loc_8:* = _loc_5.height;
            var _loc_9:* = new Point(param1, param2);
            var _loc_10:* = new Point(param1 + _loc_7, param2 + _loc_8);
            this.setupTooltipLocation(_loc_7, _loc_8, _loc_9, _loc_10);
            return;
        }// end function

        override protected function setupTooltipLocation(param1:Number, param2:Number, param3:Point, param4:Point) : void
        {
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            _loc_5 = param3.x;
            _loc_6 = param3.y;
            if (_stage.stageWidth < _loc_5 + param1)
            {
                _loc_5 = _stage.stageWidth - param1;
            }
            if (_stage.stageHeight < _loc_6 + param2)
            {
                _loc_6 = _stage.stageHeight - param2;
            }
            _tooltipRef.x = _loc_5;
            _tooltipRef.y = _loc_6;
            return;
        }// end function

        override public function showTooltip(event:MouseEvent, param2:Sprite, param3:Stage, param4:Object) : void
        {
            _stage = param3;
            RemoveFromSprite(param2);
            ClearChildTooltipUnit();
            SLOT_BINDING = param4["BINDING"];
            var _loc_5:* = param4;
            _loc_5["canvas"] = param2;
            this.ConstructTooltip(_loc_5);
            return;
        }// end function

    }
}
