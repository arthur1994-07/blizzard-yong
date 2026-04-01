package ran.ui.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.ui.*;
    import ran.ui.*;
    import ran.ui.core.*;
    import ran.ui.slot.*;
    import scaleform.gfx.*;

    public class BasicTooltip extends BaseTooltipUnit
    {
        var offsetY:int = 0;

        public function BasicTooltip()
        {
            _tooltipType = BASIC_TOOLTIP;
            SLOT_BINDING = SLOT_TOOLTIP_ID;
            return;
        }// end function

        override protected function ConstructTooltip(param1:Object) : void
        {
            var _loc_40:* = 0;
            var _loc_41:* = null;
            var _loc_42:* = null;
            var _loc_2:* = param1["event"] as MouseEvent;
            var _loc_3:* = param1["canvas"] as Sprite;
            var _loc_4:* = _loc_2.target as MovieClip;
            var _loc_5:* = param1["header"];
            var _loc_6:* = param1["tooltip"];
            if (_loc_5 == null || _loc_6 == null)
            {
                return;
            }
            var _loc_7:* = param1["trade"];
            var _loc_8:* = param1["purchase"];
            var _loc_9:* = param1["fightingpoint"];
            var _loc_10:* = param1["AtkPoint"];
            var _loc_11:* = param1["DefPoint"];
            var _loc_12:* = _loc_4.addSlotCount;
            var _loc_13:* = _loc_4.addSlotBinding;
            var _loc_14:* = _loc_4.tradeSlotCount;
            var _loc_15:* = _loc_4.tradeSlotBinding;
            var _loc_16:* = false;
            var _loc_17:* = 0;
            if (_tooltipRef == null)
            {
                _tooltipRef = new Tooltip();
            }
            _loc_3.addChild(_tooltipRef);
            _tooltipRef["slot"].useCoolDown = true;
            var _loc_18:* = _tooltipRef["textField"];
            var _loc_19:* = _tooltipRef["header"];
            var _loc_20:* = _tooltipRef["tfTrade"];
            var _loc_21:* = _tooltipRef["tfType"];
            var _loc_22:* = _tooltipRef["tfPurchase"];
            var _loc_23:* = _tooltipRef["tfFightingPoint"];
            var _loc_24:* = _tooltipRef["tfAtkPoint"];
            var _loc_25:* = _tooltipRef["tfDefPoint"];
            _loc_18.wordWrap = false;
            _loc_19.wordWrap = false;
            _loc_20.wordWrap = false;
            _loc_21.wordWrap = false;
            _loc_21.visible = false;
            _loc_22.wordWrap = false;
            _loc_22.visible = false;
            _loc_23.visible = false;
            _loc_24.visible = false;
            _loc_25.visible = false;
            _loc_18.htmlText = _loc_6;
            _loc_19.htmlText = _loc_5;
            if (_loc_7)
            {
                _loc_20.htmlText = _loc_7;
            }
            else
            {
                _loc_20.text = "";
            }
            if (_loc_9)
            {
                _loc_23.text = _loc_9;
            }
            else
            {
                _loc_23.text = "";
            }
            if (_loc_24)
            {
                _loc_24.text = _loc_10;
            }
            else
            {
                _loc_24.text = "";
            }
            if (_loc_25)
            {
                _loc_25.text = _loc_11;
            }
            else
            {
                _loc_25.text = "";
            }
            if (_loc_8)
            {
                _loc_22.htmlText = _loc_8;
                _loc_16 = true;
                _loc_22.visible = true;
            }
            else
            {
                _loc_22.text = "";
            }
            var _loc_26:* = _tooltipRef["tfType"];
            if (param1["typetext"] != null)
            {
                _loc_26.visible = true;
                pushTypeText_HTMLText(param1["typetext"]);
            }
            else
            {
                _loc_26.visible = false;
            }
            var _loc_27:* = _tooltipRef["slot"];
            _loc_27.TooltipException();
            _loc_27.binding = SLOT_BINDING;
            _loc_27.valueAmount.visible = false;
            if (_loc_4 is MDragTarget || _loc_4 is Slot)
            {
                _loc_4.ShowTooltipSlot(_loc_27.binding);
            }
            else if (param1["skillid"] != null)
            {
                DataAdapter.showTooltipSlot_byID(param1["skillid"] as int, SLOT_BINDING, SKILL_SUB_TOOLTIP as int);
            }
            else if (param1["itemid"] != null)
            {
                DataAdapter.showTooltipSlot_byID(param1["itemid"] as int, SLOT_BINDING, ITEM_SUB_TOOLTIP as int);
            }
            if (this.offsetY != 0)
            {
                _loc_27.y = _loc_27.y - this.offsetY;
                _loc_19.y = _loc_19.y - this.offsetY;
                this.offsetY = 0;
            }
            if (_loc_26.visible == true)
            {
                this.offsetY = _loc_26.height;
                _loc_27.y = _loc_27.y + this.offsetY;
                _loc_19.y = _loc_19.y + this.offsetY;
            }
            var _loc_28:* = Math.max(_minTooltipWidth, _loc_18.textWidth + 4);
            if (Math.max(_minTooltipWidth, _loc_18.textWidth + 4) > _maxTooltipWidth)
            {
                _loc_28 = _maxTooltipWidth;
                _loc_18.wordWrap = true;
            }
            _loc_18.width = _loc_28;
            _loc_18.height = Math.ceil(_loc_18.textHeight) + 4;
            var _loc_29:* = Math.max(_minTooltipWidth - _loc_19.x, _loc_19.textWidth + 4);
            if (Math.max(_minTooltipWidth - _loc_19.x, _loc_19.textWidth + 4) > _loc_28 - _loc_19.x)
            {
                if (_loc_19.textWidth > _loc_18.textWidth * 3)
                {
                    _loc_29 = Math.min(_maxTooltipWidth, (_maxTooltipWidth - _loc_19.x) / 2);
                }
                else
                {
                    _loc_29 = Math.min(_maxTooltipWidth, _loc_19.textWidth + 4);
                }
                _loc_19.wordWrap = true;
            }
            _loc_19.width = _loc_29;
            if (_loc_19.textHeight + 4 < 40)
            {
                _loc_19.height = 40;
            }
            else
            {
                _loc_19.height = _loc_19.textHeight + 4;
            }
            _loc_18.y = _loc_19.y + _loc_19.height;
            var _loc_30:* = _tooltipRef["bg"];
            _loc_30.width = Math.max(_loc_28 + 10, _loc_19.x + _loc_29);
            _loc_23.x = _loc_30.width - _loc_23.width - 10;
            _loc_24.x = _loc_30.width - _loc_24.width - 10;
            _loc_25.x = _loc_30.width - _loc_25.width - 10;
            var _loc_31:* = 0;
            if (_loc_12 < 10)
            {
                _loc_31 = _loc_27.width * _loc_12;
            }
            else
            {
                _loc_31 = _loc_27.width * 10;
            }
            _loc_31 = Math.max(_loc_31, _minTooltipWidth);
            _loc_31 = Math.min(_loc_31, _maxTooltipWidth);
            _loc_30.width = Math.max(_loc_31 + 20, _loc_30.width);
            var _loc_32:* = 0;
            if (_loc_12 > 20)
            {
                _loc_32 = _loc_27.height * 3;
            }
            else if (_loc_12 > 10)
            {
                _loc_32 = _loc_27.height * 2;
            }
            else if (_loc_12 > 0)
            {
                _loc_32 = _loc_27.height;
            }
            _loc_30.height = _loc_18.y + _loc_18.height + 10 + _loc_32;
            if (_loc_7 && _loc_7.length != 0)
            {
                _loc_30.height = _loc_30.height + _loc_20.height;
            }
            if (_loc_22.textWidth + 4 > _loc_30.width)
            {
                _loc_22.width = _loc_30.width - 4;
                _loc_22.wordWrap = true;
            }
            else
            {
                _loc_22.width = _loc_22.textWidth + 4;
            }
            _loc_22.height = _loc_22.textHeight + 4;
            if (_loc_8 && _loc_8.length != 0)
            {
                _loc_30.height = _loc_30.height + _loc_22.height;
            }
            _loc_32 = 0;
            if (_loc_14 > 5)
            {
                _loc_32 = _loc_27.height * 2;
                _loc_30.height = _loc_30.height + (_loc_32 + 10);
            }
            else if (_loc_14 > 0)
            {
                _loc_32 = _loc_27.height;
                _loc_30.height = _loc_30.height + (_loc_32 + 10);
            }
            var _loc_33:* = _loc_30.width;
            var _loc_34:* = _loc_30.height;
            var _loc_35:* = new Point(_loc_4.x, _loc_4.y);
            var _loc_36:* = new Point(_loc_4.x + _loc_4.width, _loc_4.y + _loc_4.height);
            var _loc_37:* = _loc_4.parent;
            var _loc_38:* = _loc_37.localToGlobal(_loc_35);
            var _loc_39:* = _loc_37.localToGlobal(_loc_36);
            setupTooltipLocation(_loc_33, _loc_34, _loc_38, _loc_39);
            InteractiveObjectEx.setHitTestDisable(_tooltipRef, true);
            if (_loc_12 == 0)
            {
                _loc_20.y = _loc_18.y + _loc_18.height + 5;
                _loc_17 = _loc_18.y + _loc_18.height;
            }
            _loc_40 = 1;
            while (_loc_40 <= ADD_SLOT_COUNT)
            {
                
                _loc_41 = "addSlot" + _loc_40;
                _loc_27 = _tooltipRef[_loc_41];
                if (_loc_12 < _loc_40)
                {
                    _loc_27.visible = false;
                }
                else
                {
                    _loc_27.visible = true;
                    _loc_27.binding = _loc_13 + _loc_40;
                    _loc_27.y = _loc_18.y + _loc_18.height + 5;
                    if (_loc_40 > 20)
                    {
                        _loc_27.y = _loc_27.y + _loc_27.height * 2;
                    }
                    else if (_loc_40 > 10)
                    {
                        _loc_27.y = _loc_27.y + _loc_27.height;
                    }
                    _loc_20.y = _loc_27.y + _loc_27.height;
                    _loc_17 = _loc_27.y + _loc_27.height;
                }
                _loc_40++;
            }
            _loc_40 = 1;
            while (_loc_40 <= TRADE_SLOT_COUNT)
            {
                
                _loc_42 = "TradeSlot" + _loc_40;
                _loc_27 = _tooltipRef[_loc_42];
                if (_loc_14 < _loc_40)
                {
                    _loc_27.visible = false;
                }
                else
                {
                    _loc_27.visible = true;
                    _loc_27.binding = _loc_15 + _loc_40;
                    _loc_27.y = _loc_20.y + _loc_20.height + 2;
                    _loc_17 = _loc_20.y + _loc_20.height + 2;
                    if (_loc_40 > 5)
                    {
                        _loc_27.y = _loc_27.y + _loc_27.height;
                        _loc_17 = _loc_27.y;
                    }
                }
                _loc_40++;
            }
            if (_loc_16)
            {
                _loc_22.y = _loc_17 + 5;
            }
            return;
        }// end function

        protected function onShowFightingPoint(event:KeyboardEvent) : void
        {
            var _loc_2:* = _tooltipRef["tfFightingPoint"];
            var _loc_3:* = _tooltipRef["tfAtkPoint"];
            var _loc_4:* = _tooltipRef["tfDefPoint"];
            if (event.altKey == true)
            {
                _loc_2.visible = true;
                _loc_3.visible = true;
                _loc_4.visible = true;
            }
            else
            {
                _loc_2.visible = false;
                _loc_3.visible = false;
                _loc_4.visible = false;
            }
            return;
        }// end function

        protected function onUnShowFightingPoint(event:KeyboardEvent) : void
        {
            var _loc_2:* = _tooltipRef["tfFightingPoint"];
            var _loc_3:* = _tooltipRef["tfAtkPoint"];
            var _loc_4:* = _tooltipRef["tfDefPoint"];
            _loc_2.visible = false;
            _loc_3.visible = false;
            _loc_4.visible = false;
            return;
        }// end function

        override public function showTooltip(event:MouseEvent, param2:Sprite, param3:Stage, param4:Object) : void
        {
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_12:* = null;
            var _loc_13:* = null;
            var _loc_14:* = null;
            var _loc_15:* = null;
            var _loc_16:* = null;
            var _loc_17:* = null;
            var _loc_18:* = null;
            var _loc_19:* = null;
            var _loc_20:* = null;
            var _loc_21:* = null;
            var _loc_22:* = null;
            var _loc_23:* = 0;
            var _loc_24:* = null;
            var _loc_25:* = null;
            var _loc_26:* = null;
            var _loc_27:* = null;
            var _loc_28:* = null;
            var _loc_29:* = null;
            var _loc_30:* = null;
            var _loc_31:* = null;
            var _loc_32:* = null;
            var _loc_33:* = null;
            var _loc_34:* = null;
            var _loc_35:* = null;
            var _loc_36:* = null;
            _stage = param3;
            _stage.addEventListener(KeyboardEvent.KEY_UP, this.onUnShowFightingPoint, false, 0, true);
            _stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onShowFightingPoint, false, 0, true);
            _stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onShowOptionalTooltip);
            var _loc_5:* = param4["type"];
            RemoveFromSprite(param2);
            ClearChildTooltipUnit();
            param4["event"] = event;
            param4["canvas"] = param2;
            this.ConstructTooltip(param4);
            var _loc_6:* = event.target as MovieClip;
            var _loc_7:* = (_loc_6).subTooltip;
            if (_loc_7 == null)
            {
                return;
            }
            var _loc_8:* = _loc_7["sub_info"];
            if (_loc_8 != null)
            {
                _loc_9 = _loc_8["multi_info"];
                _loc_10 = _loc_8["link_info"];
                _loc_11 = _loc_8["delay_info"];
                _loc_12 = _loc_8["durability_info"];
                _loc_13 = _loc_8["disguise_info"];
                _loc_14 = _loc_8["active_info"];
                _loc_15 = _loc_8["compare_info"];
                _loc_16 = _loc_8["rebuild_info"];
                _loc_17 = _tooltipRef["bg"];
                if (_loc_13 != null)
                {
                    _loc_13["BINDING"] = SLOT_TOOLTIP_ID_DISGUISE;
                    _loc_18 = new SubSkillTooltip();
                    _loc_19 = PushChildTooltip(_loc_18) as SubSkillTooltip;
                    _loc_19.showTooltip(event, param2, param3, _loc_13);
                }
                if (_loc_9 != null)
                {
                    _loc_9["BINDING"] = SLOT_TOOLTIP_ID_MULTISKILL;
                    _loc_20 = new SubSkillTooltip();
                    _loc_21 = PushChildTooltip(_loc_20) as SubSkillTooltip;
                    _loc_21.showTooltip(event, param2, param3, _loc_9);
                }
                if (_loc_10 != null)
                {
                    _loc_22 = _loc_10 as Array;
                    if (_loc_22 == null)
                    {
                        return;
                    }
                    _loc_23 = 0;
                    while (_loc_23 < _loc_22.length)
                    {
                        
                        _loc_24 = _loc_22[_loc_23] as Object;
                        if (_loc_24 == null)
                        {
                        }
                        else
                        {
                            _loc_24["BINDING"] = SLOT_TOOLTIP_ID_LINKSKILL + "_" + _loc_23.toString();
                            _loc_25 = new SubSkillTooltip();
                            _loc_26 = PushChildTooltip(_loc_25) as SubSkillTooltip;
                            _loc_26.showTooltip(event, param2, param3, _loc_24);
                        }
                        _loc_23++;
                    }
                }
                if (_loc_11 != null)
                {
                    _loc_11["BINDING"] = SLOT_TOOLTIP_ID_DELAYSKILL;
                    _loc_27 = new SubSkillTooltip();
                    _loc_28 = PushChildTooltip(_loc_27) as SubSkillTooltip;
                    _loc_28.showTooltip(event, param2, param3, _loc_11);
                }
                if (_loc_12 != null)
                {
                    _loc_12["BINDING"] = SLOT_TOOLTIP_ID_BOOST;
                    _loc_29 = new SubItemTooltip();
                    _loc_30 = PushChildTooltip(_loc_29) as SubItemTooltip;
                    _loc_30.showTooltip(event, param2, param3, _loc_12);
                }
                if (_loc_14 != null)
                {
                    _loc_14["BINDING"] = SLOT_TOOLTIP_ID_ACTIVE;
                    _loc_31 = new SubSkillTooltip();
                    _loc_32 = PushChildTooltip(_loc_31) as SubSkillTooltip;
                    _loc_32.showTooltip(event, param2, param3, _loc_14);
                }
                if (_loc_15 != null)
                {
                    _loc_15["BINDING"] = SLOT_TOOLTIP_COMPARE_ID;
                    _loc_33 = new SubItemTooltip();
                    _loc_34 = PushChildTooltip(_loc_33) as SubItemTooltip;
                    _loc_34.tooltipClassName = "TooltipCompare";
                    _loc_34.showTooltip(event, param2, param3, _loc_15);
                }
                if (_loc_16 != null)
                {
                    _loc_16["BINDING"] = SLOT_TOOLTIP_ID;
                    _loc_35 = new SubRebuildTooltip();
                    _loc_36 = PushChildTooltip(_loc_35) as SubRebuildTooltip;
                    _loc_36.showTooltip(event, param2, param3, _loc_16);
                }
            }
            this.AdjustAllTooltipPos();
            return;
        }// end function

        protected function AdjustAllTooltipPos() : void
        {
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = 0;
            var _loc_10:* = null;
            var _loc_11:* = 0;
            var _loc_12:* = 0;
            var _loc_13:* = 0;
            var _loc_14:* = null;
            var _loc_15:* = null;
            var _loc_1:* = TooltipPos.x + TooltipSize.x;
            var _loc_2:* = TooltipPos.y;
            var _loc_3:* = new Rectangle(TooltipPos.x, TooltipPos.y, TooltipSize.x, TooltipSize.y);
            var _loc_4:* = _childTooltipArr.filter(this.isSpecialSubTooltip);
            var _loc_5:* = _childTooltipArr.filter(this.isNormalSubTooltip);
            while (_loc_6 < _loc_5.length)
            {
                
                _loc_7 = _loc_5[_loc_6] as BaseTooltipUnit;
                if (!_loc_7.tooltipRef.visible)
                {
                }
                else
                {
                    _loc_8 = null;
                    _loc_9 = _loc_7.TooltipSize.x;
                    if (_loc_5[(_loc_6 + 1)] != null)
                    {
                        _loc_8 = _loc_5[(_loc_6 + 1)] as BaseTooltipUnit;
                        _loc_9 = Math.max(_loc_9, _loc_8.TooltipSize.x);
                    }
                    _loc_7.forceRectConfigure(_loc_1, _loc_2, _loc_9);
                    if (_loc_8)
                    {
                        _loc_8.forceRectConfigure(_loc_1, _loc_2 + _loc_7.TooltipSize.y, _loc_9);
                        _loc_6++;
                    }
                    _loc_10 = new Rectangle(_loc_7.x, _loc_2, _loc_7.TooltipSize.x, 0);
                    _loc_11 = _loc_3.right;
                    if (_loc_11 > _loc_10.left)
                    {
                        _loc_12 = _loc_11 - _loc_10.left;
                        if (_loc_3.left - _loc_12 < 0)
                        {
                            _loc_12 = _loc_3.left;
                        }
                        _loc_13 = 0;
                        if (_loc_6 % 2 != 0)
                        {
                            _loc_13 = _loc_6 - 2;
                        }
                        else
                        {
                            _loc_13 = _loc_6 - 1;
                        }
                        ExternalInterface.call("OnPrintDebug", "Over Index : " + _loc_13.toString(), 0);
                        while (_loc_13 >= 0)
                        {
                            
                            _loc_14 = _loc_5[_loc_13] as BaseTooltipUnit;
                            (_loc_14).x = _loc_14.x - _loc_12;
                            _loc_13 = _loc_13 - 1;
                        }
                        _tooltipRef.x = _tooltipRef.x - _loc_12;
                    }
                    _loc_3.left = _tooltipRef.x;
                    _loc_3.right = _loc_10.right;
                    _loc_1 = _loc_1 + _loc_9;
                }
                _loc_6++;
            }
            _loc_6 = 0;
            while (_loc_6 < _loc_4.length)
            {
                
                _loc_15 = _loc_4[_loc_6] as BaseTooltipUnit;
                if (_loc_15.GetSlotBinding() == SLOT_TOOLTIP_ID_DISGUISE)
                {
                    _loc_15.forceRectConfigure(TooltipPos.x, TooltipPos.y + TooltipSize.y, _loc_15.TooltipSize.x);
                }
                if (_loc_15 is SubRebuildTooltip)
                {
                    _loc_15.tooltipRef.visible = false;
                    _loc_15.forceRectConfigure(TooltipPos.x + TooltipSize.x, TooltipPos.y, _loc_15.TooltipSize.x);
                }
                _loc_6++;
            }
            return;
        }// end function

        protected function onShowOptionalTooltip(event:KeyboardEvent) : void
        {
            var e:* = event;
            if (e.keyCode == Keyboard.CONTROL)
            {
                _stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onShowOptionalTooltip);
                _stage.addEventListener(KeyboardEvent.KEY_UP, this.onHideOptionalTooltip);
                _childTooltipArr.forEach(function (param1:BaseTooltipUnit) : void
            {
                if (param1 is SubRebuildTooltip)
                {
                    param1.tooltipRef.visible = true;
                }
                return;
            }// end function
            );
            }
            return;
        }// end function

        protected function onHideOptionalTooltip(event:KeyboardEvent) : void
        {
            var e:* = event;
            if (e.keyCode == Keyboard.CONTROL)
            {
                _stage.removeEventListener(KeyboardEvent.KEY_UP, this.onHideOptionalTooltip);
                _stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onShowOptionalTooltip);
                _childTooltipArr.forEach(function (param1:BaseTooltipUnit) : void
            {
                if (param1 is SubRebuildTooltip)
                {
                    param1.tooltipRef.visible = false;
                }
                return;
            }// end function
            );
            }
            return;
        }// end function

        protected function isSpecialSubTooltip(param1:Object) : Boolean
        {
            var _loc_2:* = param1 as BaseTooltipUnit;
            if (!_loc_2)
            {
                return false;
            }
            return _loc_2.GetSlotBinding() == SLOT_TOOLTIP_ID_DISGUISE || _loc_2 is SubRebuildTooltip;
        }// end function

        protected function isNormalSubTooltip(param1:Object) : Boolean
        {
            var _loc_2:* = param1 as BaseTooltipUnit;
            if (!_loc_2)
            {
                return false;
            }
            return !this.isSpecialSubTooltip(_loc_2);
        }// end function

    }
}
