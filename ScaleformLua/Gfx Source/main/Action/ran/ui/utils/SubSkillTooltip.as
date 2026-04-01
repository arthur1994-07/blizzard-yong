package ran.ui.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import ran.ui.*;
    import ran.ui.slot.*;
    import scaleform.gfx.*;

    public class SubSkillTooltip extends BaseTooltipUnit
    {

        public function SubSkillTooltip()
        {
            _tooltipType = BaseTooltipUnit.SKILL_SUB_TOOLTIP;
            return;
        }// end function

        override protected function ConstructTooltip(param1:Object) : void
        {
            var _loc_22:* = 0;
            var _loc_23:* = 0;
            var _loc_24:* = null;
            var _loc_25:* = null;
            var _loc_2:* = param1["canvas"] as Sprite;
            var _loc_3:* = param1["header"];
            var _loc_4:* = param1["tooltip"];
            if (_tooltipRef == null)
            {
                _tooltipRef = new Tooltip();
            }
            _loc_2.addChild(_tooltipRef);
            _tooltipRef["slot"].useCoolDown = true;
            var _loc_5:* = _tooltipRef["textField"];
            var _loc_6:* = _tooltipRef["header"];
            var _loc_7:* = _tooltipRef["tfTrade"];
            var _loc_8:* = _tooltipRef["tfPurchase"];
            var _loc_9:* = _tooltipRef["tfFightingPoint"];
            var _loc_10:* = _tooltipRef["tfAtkPoint"];
            var _loc_11:* = _tooltipRef["tfDefPoint"];
            _loc_9.visible = false;
            _loc_10.visible = false;
            _loc_11.visible = false;
            _loc_5.wordWrap = false;
            _loc_6.wordWrap = false;
            _loc_7.wordWrap = false;
            _loc_8.wordWrap = false;
            _loc_5.htmlText = _loc_4;
            _loc_6.htmlText = _loc_3;
            _loc_7.text = "";
            _loc_8.text = "";
            var _loc_12:* = _tooltipRef["tfType"];
            if (param1["typetext"] != null)
            {
                _loc_12.visible = true;
                pushTypeText_HTMLText(param1["typetext"]);
            }
            else
            {
                _loc_12.visible = false;
            }
            var _loc_13:* = _tooltipRef["slot"];
            _loc_13.TooltipException();
            _loc_13.binding = SLOT_BINDING;
            _loc_13.valueAmount.visible = false;
            DataAdapter.showTooltipSlot_byID(param1["skillid"] as int, SLOT_BINDING, _tooltipType as int);
            if (_loc_12.visible == true)
            {
                _loc_23 = _loc_12.y + _loc_12.height;
                _loc_13.y = _loc_23;
                _loc_6.y = _loc_23;
            }
            var _loc_14:* = Math.max(_minTooltipWidth, _loc_5.textWidth + 10);
            if (Math.max(_minTooltipWidth, _loc_5.textWidth + 10) > _maxTooltipWidth)
            {
                _loc_14 = _maxTooltipWidth;
                _loc_5.wordWrap = true;
            }
            _loc_5.width = _loc_14;
            _loc_5.height = Math.ceil(_loc_5.textHeight) + 10;
            var _loc_15:* = Math.max(_minTooltipWidth - _loc_6.x, _loc_6.textWidth + 10);
            if (Math.max(_minTooltipWidth - _loc_6.x, _loc_6.textWidth + 10) > _loc_14 - _loc_6.x)
            {
                if (_loc_6.textWidth > _loc_5.textWidth * 3)
                {
                    _loc_15 = Math.min(_maxTooltipWidth, (_maxTooltipWidth - _loc_6.x) / 2);
                }
                else
                {
                    _loc_15 = Math.min(_maxTooltipWidth, _loc_6.textWidth + 10);
                }
                _loc_6.wordWrap = true;
            }
            _loc_6.width = _loc_15;
            _loc_6.height = _loc_6.textHeight + 10;
            if (_loc_5.y < _loc_6.y + _loc_6.height)
            {
                _loc_5.y = _loc_6.y + _loc_6.height;
            }
            var _loc_16:* = _tooltipRef["bg"];
            _loc_16.width = Math.max(_loc_14 + 10, _loc_6.x + _loc_15);
            var _loc_17:* = 0;
            _loc_16.height = _loc_5.y + _loc_5.height + 10 + _loc_17;
            var _loc_18:* = _loc_16.width;
            var _loc_19:* = _loc_16.height;
            var _loc_20:* = new Point(0, 0);
            var _loc_21:* = new Point(_loc_20.x + _loc_18, _loc_20.y + _loc_19);
            this.setupTooltipLocation(_loc_18, _loc_19, _loc_20, _loc_21);
            InteractiveObjectEx.setHitTestDisable(_tooltipRef, true);
            _loc_7.y = _loc_5.y + _loc_5.height + 5;
            _loc_22 = 1;
            while (_loc_22 <= ADD_SLOT_COUNT)
            {
                
                _loc_24 = "addSlot" + _loc_22;
                _loc_13 = _tooltipRef[_loc_24];
                _loc_13.visible = false;
                _loc_22++;
            }
            _loc_22 = 1;
            while (_loc_22 <= TRADE_SLOT_COUNT)
            {
                
                _loc_25 = "TradeSlot" + _loc_22;
                _loc_13 = _tooltipRef[_loc_25];
                _loc_13.visible = false;
                _loc_22++;
            }
            return;
        }// end function

        override public function forceRectConfigure(param1:Number, param2:Number, param3:Number) : void
        {
            var _loc_4:* = _tooltipRef["textField"];
            var _loc_5:* = _tooltipRef["header"];
            var _loc_6:* = _tooltipRef["tfTrade"];
            var _loc_7:* = _tooltipRef["bg"];
            var _loc_8:* = Math.max(_minTooltipWidth, param3 - 10);
            if (Math.max(_minTooltipWidth, param3 - 10) > _maxTooltipWidth)
            {
                _loc_8 = _maxTooltipWidth;
                _loc_4.wordWrap = true;
            }
            _loc_4.width = _loc_8;
            _loc_4.height = Math.ceil(_loc_4.textHeight) + 10;
            var _loc_9:* = Math.max(_minTooltipWidth - _loc_5.x, _loc_5.textWidth + 10);
            if (Math.max(_minTooltipWidth - _loc_5.x, _loc_5.textWidth + 10) > _loc_8 - _loc_5.x)
            {
                if (_loc_5.textWidth > _loc_4.textWidth * 3)
                {
                    _loc_9 = Math.min(_maxTooltipWidth, (_maxTooltipWidth - _loc_5.x) / 2);
                }
                else
                {
                    _loc_9 = Math.min(_maxTooltipWidth, _loc_5.textWidth + 10);
                }
                _loc_5.wordWrap = true;
            }
            _loc_5.width = _loc_9;
            _loc_5.height = _loc_5.textHeight + 10;
            if (_loc_4.y < _loc_5.y + _loc_5.height)
            {
                _loc_4.y = _loc_5.y + _loc_5.height;
            }
            _loc_7.width = Math.max(_loc_8 + 10, _loc_5.x + _loc_9);
            var _loc_10:* = 0;
            _loc_10 = Math.max(_loc_10, _minTooltipWidth);
            _loc_10 = Math.min(_loc_10, _maxTooltipWidth);
            _loc_7.width = Math.max(_loc_10 + 20, _loc_7.width);
            var _loc_11:* = 0;
            _loc_7.height = _loc_4.y + _loc_4.height + 10 + _loc_11;
            var _loc_12:* = _loc_7.width;
            var _loc_13:* = _loc_7.height;
            var _loc_14:* = new Point(param1, param2);
            var _loc_15:* = new Point(param1 + _loc_12, param2 + _loc_13);
            this.setupTooltipLocation(_loc_12, _loc_13, _loc_14, _loc_15);
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
