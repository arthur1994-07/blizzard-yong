package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;

    public class ListItemRenderer extends Button implements IListItemRenderer
    {
        protected var _index:uint = 0;
        protected var _selectable:Boolean = true;
        protected var _arrLabel:Array;
        protected var _usePrevLabel:Boolean = true;

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

        public function setListData(param1:ListData) : void
        {
            this.index = param1.index;
            selected = param1.selected;
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
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            super.onRollOverTooltip(event);
            SimpleTooltip = "";
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            while (_loc_3 < this.numChildren)
            {
                
                _loc_4 = this.getChildAt(_loc_3) as TextField;
                if (_loc_4 == null || _loc_4.visible == false)
                {
                }
                else if (_loc_4.width * this.scaleX < _loc_4.textWidth)
                {
                    if (SimpleTooltip != "")
                    {
                        SimpleTooltip = SimpleTooltip + "  /  ";
                    }
                    SimpleTooltip = SimpleTooltip + _loc_4.text;
                    _loc_2 = _loc_2 + _loc_4.x;
                }
                _loc_3++;
            }
            if (SimpleTooltip != "")
            {
                _loc_5 = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
                _loc_5.component = this;
                _loc_5.tooltip = this.SimpleTooltip;
                _loc_5.localX = this.x + _loc_2;
                _loc_5.localY = this.y;
                _loc_6 = this.parent;
                while (_loc_6 != null)
                {
                    
                    _loc_5.localX = _loc_5.localX + _loc_6.x;
                    _loc_5.localY = _loc_5.localY + _loc_6.y;
                    _loc_6 = _loc_6.parent;
                }
                if (root != null)
                {
                    root.dispatchEvent(_loc_5);
                }
            }
            return;
        }// end function

        override protected function onRollOutTooltip(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (SimpleTooltip != "")
            {
                _loc_2 = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
                _loc_2.component = this;
                _loc_2.tooltip = this.SimpleTooltip;
                _loc_2.localX = this.x;
                _loc_2.localY = this.y;
                _loc_3 = this.parent;
                while (_loc_3 != null)
                {
                    
                    _loc_2.localX = _loc_2.localX + _loc_3.x;
                    _loc_2.localY = _loc_2.localY + _loc_3.y;
                    _loc_3 = _loc_3.parent;
                }
                if (root != null)
                {
                    root.dispatchEvent(_loc_2);
                }
            }
            SimpleTooltip = "";
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_2:* = NaN;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_1:* = 0;
            if (_label != null && textField != null)
            {
                textField.htmlText = _label;
                _loc_2 = textField.width * this.scaleX;
                if (_loc_2 < textField.textWidth)
                {
                    _loc_3 = textField.text;
                    SimpleTooltip = _loc_3;
                    _loc_1 = 0;
                    while (_loc_1 < _loc_3.length)
                    {
                        
                        textField.text = _loc_3.substr(0, _loc_3.length - _loc_1) + "...";
                        if (_loc_2 - 4 > textField.textWidth)
                        {
                            break;
                        }
                        _loc_1++;
                    }
                }
                else
                {
                    SimpleTooltip = "";
                }
            }
            if (this._arrLabel)
            {
                _loc_1 = 0;
                while (true)
                {
                    
                    _loc_4 = null;
                    if (_loc_1 == 0)
                    {
                        if (textField)
                        {
                            _loc_4 = textField;
                        }
                        else if (this["textField1"])
                        {
                            _loc_4 = this["textField1"];
                        }
                    }
                    else
                    {
                        _loc_4 = this["textField" + (_loc_1 + 1)];
                    }
                    if (!_loc_4)
                    {
                        break;
                    }
                    _loc_5 = _loc_1 < this._arrLabel.length ? (this._arrLabel[_loc_1]) : ("");
                    _loc_4.htmlText = _loc_5;
                    if (_loc_1 == 0 && this._usePrevLabel == true)
                    {
                        break;
                    }
                    _loc_1++;
                }
            }
            return;
        }// end function

    }
}
