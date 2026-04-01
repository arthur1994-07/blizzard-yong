package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.gfx.*;

    public class ListItemRenderer extends Button implements IListItemRenderer
    {
        protected var _index:uint = 0;
        protected var _selectable:Boolean = true;
        protected var _arrLabel:Array;
        protected var _usePrevLabel:Boolean = true;
        protected var _scaledText:Boolean = false;

        public function ListItemRenderer()
        {
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            return;
        }// end function

        public function get index() : uint
        {
            return this._index;
        }// end function

        public function set index(param1:uint) : void
        {
            this._index = param1;
            return;
        }// end function

        public function get selectable() : Boolean
        {
            return this._selectable;
        }// end function

        public function set selectable(param1:Boolean) : void
        {
            this._selectable = param1;
            return;
        }// end function

        public function get expanded() : Boolean
        {
            return false;
        }// end function

        public function set expanded(param1:Boolean) : void
        {
            return;
        }// end function

        public function get checked() : Boolean
        {
            return false;
        }// end function

        public function set checked(param1:Boolean) : void
        {
            return;
        }// end function

        public function get usePrevLabel() : Boolean
        {
            return this._usePrevLabel;
        }// end function

        public function set usePrevLabel(param1:Boolean) : void
        {
            if (this._usePrevLabel == param1)
            {
                return;
            }
            this._usePrevLabel = param1;
            invalidateData();
            return;
        }// end function

        override public function get selected() : Boolean
        {
            return _selected;
        }// end function

        override public function set selected(param1:Boolean) : void
        {
            var _loc_2:* = false;
            if (_selected == param1)
            {
                return;
            }
            if (!this._selectable)
            {
                return;
            }
            _selected = param1;
            if (enabled)
            {
                if (!_focused)
                {
                    setState("toggle");
                }
                else if (_pressedByKeyboard && _focusIndicator != null)
                {
                }
                else
                {
                    setState("selecting");
                }
                if (owner)
                {
                    _loc_2 = _selected && owner != null && checkOwnerFocused();
                    setState(_loc_2 && _focusIndicator == null ? ("selecting") : ("toggle"));
                    this.displayFocus = _loc_2;
                }
            }
            else
            {
                setState("disabled");
            }
            validateNow();
            dispatchEventAndSound(new Event(Event.SELECT));
            return;
        }// end function

        override public function get displayFocus() : Boolean
        {
            return _displayFocus;
        }// end function

        override public function set displayFocus(param1:Boolean) : void
        {
            if (param1 == _displayFocus)
            {
                return;
            }
            if (!this._selectable)
            {
                return;
            }
            _displayFocus = param1;
            changeFocus();
            return;
        }// end function

        public function setListData(param1:ListData) : void
        {
            this.index = param1.index;
            this.selected = param1.selected;
            this._arrLabel = param1.label;
            invalidateData();
            return;
        }// end function

        public function setData(param1:Object) : void
        {
            this.data = param1;
            return;
        }// end function

        public function setLabelOffsetX(param1:int) : void
        {
            return;
        }// end function

        public function getLeafDataProvider() : DataProvider
        {
            return null;
        }// end function

        override public function toString() : String
        {
            return "[CLIK ListItemRenderer " + this.index + ", " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            focusTarget = owner;
            var _loc_1:* = false;
            mouseChildren = false;
            tabChildren = _loc_1;
            tabEnabled = _loc_1;
            _focusable = _loc_1;
            return;
        }// end function

        override protected function onRollOverTooltip(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (this.data != null && this.data.hasOwnProperty("TooltipHtmlText") == true)
            {
                TooltipHtmlText = this.data["TooltipHtmlText"];
            }
            else if (this.data != null && this.data.hasOwnProperty("TooltipText") == true)
            {
                TooltipText = this.data["TooltipText"];
            }
            if (TooltipHtmlText != "")
            {
                _loc_2 = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
                _loc_2.component = this;
                _loc_2.tooltip = this.TooltipHtmlText;
                _loc_2.localX = this.x;
                _loc_2.localY = this.y;
                _loc_2.htmlText = _isHtmlTooltipText;
                _loc_3 = this.parent;
                while (_loc_3 != null)
                {
                    
                    _loc_2.localX = _loc_2.localX + _loc_3.x;
                    _loc_2.localY = _loc_2.localY + _loc_3.y;
                    _loc_3 = _loc_3.parent;
                }
                if (stage != null)
                {
                    stage.dispatchEvent(_loc_2);
                }
            }
            return;
        }// end function

        override protected function onRollOutTooltip(event:MouseEvent) : void
        {
            var _loc_2:* = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
            _loc_2.component = this;
            _loc_2.localX = this.x;
            _loc_2.localY = this.y;
            var _loc_3:* = this.parent;
            while (_loc_3 != null)
            {
                
                _loc_2.localX = _loc_2.localX + _loc_3.x;
                _loc_2.localY = _loc_2.localY + _loc_3.y;
                _loc_3 = _loc_3.parent;
            }
            if (stage != null)
            {
                stage.dispatchEvent(_loc_2);
            }
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = 0;
            var _loc_11:* = NaN;
            var _loc_12:* = null;
            var _loc_13:* = 0;
            var _loc_14:* = 0;
            var _loc_15:* = null;
            var _loc_1:* = 0;
            if (this._arrLabel)
            {
                TooltipHtmlText = "";
                _loc_2 = 0;
                _loc_3 = parent as Sprite;
                if (_loc_3 != null)
                {
                    _loc_4 = _loc_3.parent as ScrollingList;
                    if (_loc_4 != null && _loc_4.treeList == true)
                    {
                        _loc_5 = _loc_4.getTreeButton(this._index);
                        _loc_6 = _loc_4.getTreeCheckBox(this._index);
                        if (_loc_6 != null)
                        {
                            _loc_2 = _loc_2 + (_loc_6.x + _loc_6.width);
                        }
                        else if (_loc_5 != null)
                        {
                            _loc_2 = _loc_2 + (_loc_5.x + _loc_5.width);
                        }
                    }
                }
                _loc_1 = 0;
                while (true)
                {
                    
                    _loc_7 = "";
                    _loc_8 = null;
                    if (_loc_1 == 0)
                    {
                        if (textField)
                        {
                            _loc_8 = textField;
                            _loc_7 = "textField";
                        }
                        else if (this["textField1"])
                        {
                            _loc_8 = this["textField1"];
                            _loc_7 = "textField1";
                        }
                    }
                    else
                    {
                        _loc_7 = "textField" + (_loc_1 + 1);
                        _loc_8 = this[_loc_7];
                    }
                    if (!_loc_8)
                    {
                        break;
                    }
                    _loc_9 = _loc_1 < this._arrLabel.length ? (this._arrLabel[_loc_1]) : ("");
                    _loc_8.htmlText = _loc_9;
                    _loc_10 = 0;
                    if (_loc_8.getTextFormat().leftMargin > 0)
                    {
                        _loc_10 = int(_loc_8.getTextFormat().leftMargin);
                    }
                    _loc_11 = _loc_8.width * this.scaleX - _loc_2;
                    if (_loc_11 < _loc_8.textWidth - _loc_10)
                    {
                        _loc_12 = _loc_8.text;
                        _loc_13 = 0;
                        while (_loc_13 < _loc_12.length)
                        {
                            
                            _loc_8.text = _loc_12.substr(0, _loc_12.length - _loc_13) + "...";
                            if (_loc_11 - 4 > _loc_8.textWidth)
                            {
                                if (TooltipHtmlText != "")
                                {
                                    TooltipHtmlText = TooltipHtmlText + "  /  ";
                                }
                                TooltipHtmlText = TooltipHtmlText + _loc_9;
                                break;
                            }
                            _loc_13++;
                        }
                    }
                    if (data != null && !(data is String))
                    {
                        _loc_14 = _loc_1 + 1;
                        _loc_15 = _loc_8.getTextFormat();
                        if (_loc_1 == 0)
                        {
                            if (data["color"])
                            {
                                _loc_15.color = data["color"];
                            }
                            else if (data["color" + _loc_14])
                            {
                                _loc_15.color = data["color" + _loc_14];
                            }
                        }
                        else if (data["color" + _loc_14])
                        {
                            _loc_15.color = data["color" + _loc_14];
                        }
                        _loc_8.setTextFormat(_loc_15, 0, _loc_8.length);
                    }
                    if (_loc_1 == 0 && this._usePrevLabel == true)
                    {
                        break;
                    }
                    _loc_1++;
                }
            }
            return;
        }// end function

        override protected function handleMousePress(event:MouseEvent) : void
        {
            var _loc_5:* = null;
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            var _loc_4:* = _loc_2 == null ? (0) : (_loc_2.buttonIdx);
            if ((_loc_2 == null ? (0) : (_loc_2.buttonIdx)) != 0)
            {
                return;
            }
            if (!this._selectable)
            {
                return;
            }
            _mouseDown = _mouseDown | 1 << _loc_3;
            if (enabled)
            {
                setState("down");
                if (autoRepeat && _repeatTimer == null)
                {
                    _autoRepeatEvent = new ButtonEvent(ButtonEvent.CLICK, true, false, _loc_3, _loc_4, false, true);
                    _repeatTimer = new Timer(repeatDelay, 1);
                    _repeatTimer.addEventListener(TimerEvent.TIMER_COMPLETE, beginRepeat, false, 0, true);
                    _repeatTimer.start();
                }
                _loc_5 = new ButtonEvent(ButtonEvent.PRESS, true, false, _loc_3, _loc_4, false, false);
                dispatchEventAndSound(_loc_5);
            }
            return;
        }// end function

    }
}
