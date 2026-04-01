package scaleform.clik.controls
{
    import flash.text.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.utils.*;

    public class Label extends UIComponent
    {
        public var constraintsDisabled:Boolean = false;
        protected var _text:String;
        protected var _autoSize:String = "none";
        protected var _autoSizeEnable:Boolean = false;
        protected var isHtml:Boolean;
        protected var state:String = "default";
        protected var _newFrame:String;
        public var textField:TextField;

        public function Label()
        {
            return;
        }// end function

        override protected function preInitialize() : void
        {
            if (!this.constraintsDisabled)
            {
                constraints = new Constraints(this, ConstrainMode.COUNTER_SCALE);
            }
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            if (param1 == super.enabled)
            {
                return;
            }
            super.enabled = param1;
            var _loc_2:* = param1;
            mouseChildren = param1;
            mouseEnabled = _loc_2;
            this.setState(this.defaultState);
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(param1:String) : void
        {
            if (param1 == null)
            {
            }
            this.isHtml = false;
            this._text = param1;
            invalidateData();
            return;
        }// end function

        public function get htmlText() : String
        {
            return this._text;
        }// end function

        public function set htmlText(param1:String) : void
        {
            if (param1 == null)
            {
            }
            this.isHtml = true;
            this._text = param1;
            invalidateData();
            return;
        }// end function

        public function get autoSize() : String
        {
            return this._autoSize;
        }// end function

        public function set autoSize(param1:String) : void
        {
            if (param1 == this._autoSize)
            {
                return;
            }
            this._autoSize = param1;
            invalidateData();
            return;
        }// end function

        public function get autoSizeEnable() : Boolean
        {
            return this._autoSizeEnable;
        }// end function

        public function set autoSizeEnable(param1:Boolean) : void
        {
            if (param1 == this._autoSizeEnable)
            {
                return;
            }
            this._autoSizeEnable = param1;
            invalidateData();
            return;
        }// end function

        public function get length() : uint
        {
            return this.textField.length;
        }// end function

        public function get defaultState() : String
        {
            return !this.enabled ? ("disabled") : (focused ? ("focused") : ("default"));
        }// end function

        public function appendText(param1:String) : void
        {
            this._text = this._text + param1;
            this.isHtml = false;
            invalidateData();
            return;
        }// end function

        public function appendHtml(param1:String) : void
        {
            this._text = this._text + param1;
            this.isHtml = true;
            invalidateData();
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK Label " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            if (!this.constraintsDisabled)
            {
                constraints.addElement("textField", this.textField, Constraints.ALL);
            }
            focusable = false;
            return;
        }// end function

        protected function calculateWidth() : Number
        {
            var _loc_2:* = null;
            if (constraints == null || this.textField == null)
            {
                return actualWidth;
            }
            if (!this.constraintsDisabled)
            {
                _loc_2 = constraints.getElement("textField");
            }
            var _loc_1:* = Math.ceil(this.textField.textWidth + _loc_2.left + _loc_2.right + 10);
            return _loc_1;
        }// end function

        protected function alignForAutoSize() : void
        {
            var _loc_2:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            if (!initialized || this._autoSize == TextFieldAutoSize.NONE || this.textField == null || this._autoSizeEnable == false)
            {
                return;
            }
            var _loc_1:* = this.textField.getTextFormat();
            _loc_1.align = "left";
            this.textField.setTextFormat(_loc_1);
            _loc_2 = _width;
            var _loc_6:* = this.calculateWidth();
            _width = this.calculateWidth();
            var _loc_3:* = _loc_6;
            switch(this._autoSize)
            {
                case TextFieldAutoSize.RIGHT:
                {
                    _loc_4 = x + _loc_2;
                    x = _loc_4 - _loc_3;
                    break;
                }
                case TextFieldAutoSize.CENTER:
                {
                    _loc_5 = x + _loc_2 * 0.5;
                    x = _loc_5 - _loc_3 * 0.5;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.STATE))
            {
                if (this._newFrame)
                {
                    gotoAndPlay(this._newFrame);
                    this._newFrame = null;
                }
                this.updateAfterStateChange();
                dispatchEventAndSound(new ComponentEvent(ComponentEvent.STATE_CHANGE));
                invalidate(InvalidationType.SIZE);
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateText();
                if (this.autoSize != TextFieldAutoSize.NONE)
                {
                    this.alignForAutoSize();
                    invalidateSize();
                }
            }
            if (isInvalid(InvalidationType.SIZE))
            {
                setActualSize(_width, _height);
                if (!this.constraintsDisabled)
                {
                    constraints.update(_width, _height);
                }
            }
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_1:* = NaN;
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (this._text != null && this.textField != null)
            {
                _loc_1 = 0;
                _loc_2 = 0;
                _loc_3 = null;
                if (this.isHtml)
                {
                    this.textField.htmlText = this._text;
                    if (this.autoSizeEnable == false)
                    {
                        if (this.autoSize != TextFieldAutoSize.NONE)
                        {
                            _loc_3 = this.textField.getTextFormat();
                            _loc_3.align = this.autoSize;
                            this.textField.setTextFormat(_loc_3);
                        }
                        _loc_1 = this.textField.width * this.scaleX;
                        if (_loc_1 < this.textField.textWidth)
                        {
                            _loc_4 = this.textField.text;
                            TooltipHtmlText = _loc_4;
                            _loc_2 = 0;
                            while (_loc_2 < _loc_4.length)
                            {
                                
                                this.textField.text = _loc_4.substr(0, _loc_4.length - _loc_2) + "...";
                                if (_loc_1 - 4 > this.textField.textWidth)
                                {
                                    break;
                                }
                                _loc_2++;
                            }
                        }
                        else
                        {
                            TooltipHtmlText = "";
                        }
                    }
                }
                else
                {
                    this.textField.text = this._text;
                    if (this.autoSizeEnable == false)
                    {
                        if (this.autoSize != TextFieldAutoSize.NONE)
                        {
                            _loc_3 = this.textField.getTextFormat();
                            _loc_3.align = this.autoSize;
                            this.textField.setTextFormat(_loc_3);
                        }
                        _loc_1 = this.textField.width * this.scaleX;
                        if (_loc_1 < this.textField.textWidth)
                        {
                            TooltipHtmlText = this._text;
                            _loc_2 = 0;
                            while (_loc_2 < this._text.length)
                            {
                                
                                this.textField.text = this._text.substr(0, this._text.length - _loc_2) + "...";
                                if (_loc_1 - 4 > this.textField.textWidth)
                                {
                                    break;
                                }
                                _loc_2++;
                            }
                        }
                        else
                        {
                            TooltipHtmlText = "";
                        }
                    }
                }
            }
            return;
        }// end function

        protected function updateAfterStateChange() : void
        {
            if (!initialized)
            {
                return;
            }
            if (constraints != null && !this.constraintsDisabled)
            {
                constraints.updateElement("textField", this.textField);
            }
            this.updateText();
            dispatchEventAndSound(new ComponentEvent(ComponentEvent.STATE_CHANGE));
            return;
        }// end function

        protected function setState(... args) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (args.length == 1)
            {
                _loc_4 = args[0].toString();
                if (this.state != _loc_4 && _labelHash[_loc_4])
                {
                    var _loc_6:* = _loc_4;
                    this._newFrame = _loc_4;
                    this.state = _loc_6;
                    invalidateState();
                }
                return;
            }
            args = args.length;
            var _loc_3:* = 0;
            while (_loc_3 < args)
            {
                
                _loc_5 = args[_loc_3].toString();
                if (_labelHash[_loc_5])
                {
                    var _loc_6:* = _loc_5;
                    this._newFrame = _loc_5;
                    this.state = _loc_6;
                    invalidateState();
                    break;
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

    }
}
