package scaleform.clik.controls
{
    import flash.events.*;
    import flash.text.*;
    import ran.ui.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;
    import scaleform.gfx.*;

    public class TextInput extends UIComponent
    {
        public var defaultTextFormat:TextFormat;
        public var constraintsDisabled:Boolean = false;
        protected var _text:String = "";
        protected var _displayAsPassword:Boolean = false;
        protected var _maxChars:uint = 0;
        protected var _maxByte:uint = 0;
        protected var _editable:Boolean = true;
        protected var _actAsButton:Boolean = false;
        protected var _alwaysShowSelection:Boolean = false;
        protected var _isHtml:Boolean = false;
        protected var _state:String = "default";
        protected var _newFrame:String;
        protected var _textFormat:TextFormat;
        protected var _usingDefaultTextFormat:Boolean = true;
        protected var _defaultText:String = "";
        protected var _TrimHtmlTag:String = "";
        protected var _logID:int = -1;
        private var hscroll:Number = 0;
        public var textField:TextField;
        protected var _onlyNumber:Boolean = false;
        protected var _restrict:String = "all";

        public function TextInput()
        {
            return;
        }// end function

        public function get trimHtmlTag() : String
        {
            return this._TrimHtmlTag;
        }// end function

        public function set logID(param1:int) : void
        {
            this._logID = param1;
            return;
        }// end function

        public function get logID() : int
        {
            return this._logID;
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
            super.tabEnabled = false;
            var _loc_1:* = this.enabled;
            mouseChildren = this.enabled;
            mouseEnabled = _loc_1;
            super.initialize();
            this._textFormat = this.textField.getTextFormat();
            this.defaultTextFormat = new TextFormat();
            this.defaultTextFormat.italic = false;
            this.defaultTextFormat.color = 16777215;
            return;
        }// end function

        protected function TrimHtmlTag() : void
        {
            var _loc_5:* = null;
            if (this._isHtml == false)
            {
                this._TrimHtmlTag = this._text;
                return;
            }
            var _loc_1:* = this._text;
            var _loc_2:* = "";
            var _loc_3:* = false;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_1.length)
            {
                
                _loc_5 = _loc_1.charAt(_loc_4);
                if (_loc_3 == false)
                {
                    if (_loc_5 == "<")
                    {
                        _loc_3 = true;
                    }
                }
                else if (_loc_5 == ">")
                {
                    _loc_3 = false;
                }
                if (_loc_3 == true)
                {
                }
                else
                {
                    _loc_2 = _loc_2 + _loc_5;
                }
                _loc_4++;
            }
            _loc_2 = _loc_2.split("&#9;").join(" ");
            _loc_2 = _loc_2.split("&gt;").join(">");
            _loc_2 = _loc_2.split("&lt;").join("<");
            _loc_2 = _loc_2.split("&amp;").join("&");
            _loc_2 = _loc_2.split("&quot;").join("\"");
            _loc_2 = _loc_2.split("&apos;").join("\'");
            this._TrimHtmlTag = _loc_2;
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            mouseChildren = param1;
            super.tabEnabled = false;
            tabChildren = _focusable;
            this.setState(this.defaultState);
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            _focusable = param1;
            if (!_focusable && this.enabled)
            {
                tabChildren = false;
            }
            this.changeFocus();
            if (_focusable && this.editable)
            {
                addEventListener(MouseEvent.MOUSE_DOWN, this.handleMouseDown, false, 0, true);
            }
            else
            {
                removeEventListener(MouseEvent.MOUSE_DOWN, this.handleMouseDown, false);
            }
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(param1:String) : void
        {
            this._isHtml = false;
            this._text = param1;
            invalidateData();
            this.TrimHtmlTag();
            return;
        }// end function

        public function get htmlText() : String
        {
            return this._text;
        }// end function

        public function set htmlText(param1:String) : void
        {
            this._isHtml = true;
            this._text = param1;
            invalidateData();
            this.TrimHtmlTag();
            return;
        }// end function

        public function get defaultText() : String
        {
            return this._defaultText;
        }// end function

        public function set defaultText(param1:String) : void
        {
            this._defaultText = param1;
            invalidateData();
            return;
        }// end function

        public function get displayAsPassword() : Boolean
        {
            return this._displayAsPassword;
        }// end function

        public function set displayAsPassword(param1:Boolean) : void
        {
            this._displayAsPassword = param1;
            if (this.textField != null)
            {
                this.textField.displayAsPassword = param1;
            }
            return;
        }// end function

        public function get maxChars() : uint
        {
            return this._maxChars;
        }// end function

        public function set maxChars(param1:uint) : void
        {
            if (this._maxByte != 0)
            {
                return;
            }
            this._maxChars = param1;
            if (this.textField != null)
            {
                this.textField.maxChars = param1;
            }
            return;
        }// end function

        public function get maxByte() : uint
        {
            return this._maxByte;
        }// end function

        public function set maxByte(param1:uint) : void
        {
            if (param1 != 0 && this._maxChars != 0)
            {
                this._maxChars = 0;
                this.textField.maxChars = 0;
            }
            this._maxByte = param1;
            return;
        }// end function

        public function set textByte(param1:int) : void
        {
            return;
        }// end function

        public function get textByte() : int
        {
            return this.GetTextByte();
        }// end function

        public function set OnlyNumber(param1:Boolean) : void
        {
            if (this.textField == null)
            {
                return;
            }
            this._onlyNumber = param1;
            if (this._onlyNumber == true)
            {
                this.textField.restrict = "0-9";
            }
            else
            {
                this.textField.restrict = null;
            }
            return;
        }// end function

        public function get OnlyNumber() : Boolean
        {
            return this._onlyNumber;
        }// end function

        public function set Restrict(param1:String) : void
        {
            if (this.textField == null)
            {
                return;
            }
            this._restrict = param1;
            if (this._restrict == "all")
            {
                this.textField.restrict = null;
            }
            else if (this._restrict == "english")
            {
                this.textField.restrict = "A-Z a-z";
            }
            else if (this._restrict == "number")
            {
                this.textField.restrict = "0-9";
            }
            else if (this._restrict == "english & number")
            {
                this.textField.restrict = "A-Z a-z 0-9";
            }
            return;
        }// end function

        public function get Restrict() : String
        {
            return this._restrict;
        }// end function

        public function set RestrictAddOn(param1:String) : void
        {
            if (this.textField == null)
            {
                return;
            }
            if (param1 == "")
            {
                return;
            }
            var _loc_2:* = "";
            var _loc_3:* = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2 = _loc_2 + (" \\" + param1.charAt(_loc_3));
                _loc_3++;
            }
            this.textField.restrict = this.textField.restrict + _loc_2;
            return;
        }// end function

        public function get editable() : Boolean
        {
            return this._editable;
        }// end function

        public function set editable(param1:Boolean) : void
        {
            this._editable = param1;
            if (this.textField != null)
            {
                this.textField.type = this._editable && this.enabled ? (TextFieldType.INPUT) : (TextFieldType.DYNAMIC);
            }
            this.focusable = param1;
            return;
        }// end function

        override public function get tabEnabled() : Boolean
        {
            return this.textField.tabEnabled;
        }// end function

        override public function set tabEnabled(param1:Boolean) : void
        {
            this.textField.tabEnabled = param1;
            return;
        }// end function

        override public function get tabIndex() : int
        {
            return this.textField.tabIndex;
        }// end function

        override public function set tabIndex(param1:int) : void
        {
            this.textField.tabIndex = param1;
            return;
        }// end function

        public function get actAsButton() : Boolean
        {
            return this._actAsButton;
        }// end function

        public function set actAsButton(param1:Boolean) : void
        {
            if (this._actAsButton == param1)
            {
                return;
            }
            this._actAsButton = param1;
            if (param1)
            {
                addEventListener(MouseEvent.ROLL_OVER, this.handleRollOver, false, 0, true);
                addEventListener(MouseEvent.ROLL_OUT, this.handleRollOut, false, 0, true);
            }
            else
            {
                removeEventListener(MouseEvent.ROLL_OVER, this.handleRollOver, false);
                removeEventListener(MouseEvent.ROLL_OUT, this.handleRollOut, false);
            }
            return;
        }// end function

        public function get alwaysShowSelection() : Boolean
        {
            return this._alwaysShowSelection;
        }// end function

        public function set alwaysShowSelection(param1:Boolean) : void
        {
            this._alwaysShowSelection = param1;
            if (this.textField != null)
            {
                this.textField.alwaysShowSelection = param1;
            }
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
            this._isHtml = false;
            invalidateData();
            this.TrimHtmlTag();
            return;
        }// end function

        public function appendHtml(param1:String) : void
        {
            this._text = this._text + param1;
            this._isHtml = true;
            invalidateData();
            this.TrimHtmlTag();
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.handled)
            {
                return;
            }
            var _loc_2:* = event.details;
            if (_loc_2.value == InputValue.KEY_DOWN || _loc_2.value == InputValue.KEY_HOLD)
            {
                return;
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK TextInput " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            if (!this.constraintsDisabled)
            {
                constraints.addElement("textField", this.textField, Constraints.ALL);
            }
            addEventListener(InputEvent.INPUT, this.handleInput, false, 0, true);
            this.textField.addEventListener(FocusEvent.FOCUS_IN, this.handleTextFieldFocusIn, false, 0, true);
            this.textField.addEventListener(FocusEvent.FOCUS_OUT, this.handleTextFieldFocusOut, false, 0, true);
            if (this.focusable && this.editable)
            {
                addEventListener(MouseEvent.MOUSE_DOWN, this.handleMouseDown, false, 0, true);
            }
            this.setState(this.defaultState, "default");
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
                this.updateTextField();
                dispatchEventAndSound(new ComponentEvent(ComponentEvent.STATE_CHANGE));
                invalidate(InvalidationType.SIZE);
            }
            else if (isInvalid(InvalidationType.DATA))
            {
                this.updateText();
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

        override protected function changeFocus() : void
        {
            this.setState(this.defaultState);
            return;
        }// end function

        protected function updateTextField() : void
        {
            if (this.textField == null)
            {
                trace(">>> Error :: " + this + ", textField is NULL.");
                return;
            }
            this.updateText();
            this.maxByte = this._maxByte;
            this.textField.maxChars = this._maxChars;
            this.textField.alwaysShowSelection = this._alwaysShowSelection;
            this.textField.selectable = this.enabled ? (this._editable) : (this.enabled);
            this.textField.type = this._editable && this.enabled ? (TextFieldType.INPUT) : (TextFieldType.DYNAMIC);
            this.textField.tabEnabled = this._editable && this.enabled && _focusable;
            this.textField.addEventListener(Event.CHANGE, this.handleTextChange, false, 0, true);
            if (this.textField.hasEventListener(FocusEvent.FOCUS_IN))
            {
                this.textField.removeEventListener(FocusEvent.FOCUS_IN, this.handleTextFieldFocusIn, false);
            }
            this.textField.addEventListener(FocusEvent.FOCUS_IN, this.handleTextFieldFocusIn, false, 0, true);
            if (this.textField.hasEventListener(FocusEvent.FOCUS_OUT))
            {
                this.textField.removeEventListener(FocusEvent.FOCUS_OUT, this.handleTextFieldFocusOut, false);
            }
            this.textField.addEventListener(FocusEvent.FOCUS_OUT, this.handleTextFieldFocusOut, false, 0, true);
            return;
        }// end function

        protected function handleTextFieldFocusIn(event:FocusEvent) : void
        {
            if (this.focusable == false)
            {
                return;
            }
            this.setState("focused");
            _focused = 1;
            if (DataAdapter.setConversionMode != null)
            {
                DataAdapter.setConversionMode();
            }
            if (DataAdapter.SetFocusInTextInput != null)
            {
                DataAdapter.SetFocusInTextInput(true);
            }
            return;
        }// end function

        protected function handleTextFieldFocusOut(event:FocusEvent) : void
        {
            this.setState("default");
            _focused = 0;
            if (DataAdapter.saveConversionMode != null)
            {
                DataAdapter.saveConversionMode();
            }
            if (DataAdapter.SetFocusInTextInput != null)
            {
                DataAdapter.SetFocusInTextInput(false);
            }
            return;
        }// end function

        override public function updateText() : void
        {
            if (_focused != 0 && this._usingDefaultTextFormat == true)
            {
                this.textField.defaultTextFormat = this._textFormat;
                this._usingDefaultTextFormat = false;
                if (this._displayAsPassword == true && this.textField.displayAsPassword == false)
                {
                    this.textField.displayAsPassword = true;
                }
            }
            if (this._text != "")
            {
                if (this._isHtml == true)
                {
                    this.textField.htmlText = this._text;
                }
                else
                {
                    this.textField.text = this._text;
                }
                this.TrimHtmlTag();
            }
            else
            {
                this.textField.text = "";
                if (_focused == 0 && this._defaultText != "")
                {
                    if (this._displayAsPassword == true)
                    {
                        this.textField.displayAsPassword = false;
                    }
                    this.textField.text = this._defaultText;
                    this._usingDefaultTextFormat = true;
                    if (this.defaultTextFormat != null)
                    {
                        this.textField.setTextFormat(this.defaultTextFormat);
                    }
                }
            }
            return;
        }// end function

        protected function setState(... args) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (args.length == 1)
            {
                _loc_4 = args[0].toString();
                if (this._state != _loc_4 && _labelHash[_loc_4])
                {
                    var _loc_6:* = _loc_4;
                    this._newFrame = _loc_4;
                    this._state = _loc_6;
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
                    this._state = _loc_6;
                    invalidateState();
                    break;
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        protected function updateAfterStateChange() : void
        {
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            if (!initialized)
            {
                return;
            }
            constraints.updateElement("textField", this.textField);
            if (_focused)
            {
                if (Extensions.isScaleform)
                {
                    _loc_1 = Extensions.numControllers;
                    _loc_2 = 0;
                    while (_loc_2 < _loc_1)
                    {
                        
                        if (FocusManager.getFocus(_loc_2) == this)
                        {
                            FocusManager.setFocus(this.textField, _loc_2);
                        }
                        _loc_2 = _loc_2 + 1;
                    }
                }
                else
                {
                    stage.focus = this.textField;
                }
            }
            return;
        }// end function

        protected function handleRollOver(event:MouseEvent) : void
        {
            if (focused || !this.enabled)
            {
                return;
            }
            this.setState("over");
            return;
        }// end function

        protected function handleRollOut(event:MouseEvent) : void
        {
            if (focused || !this.enabled)
            {
                return;
            }
            this.setState("out", "default");
            return;
        }// end function

        protected function handleMouseDown(event:MouseEvent) : void
        {
            if (focused || !this.enabled)
            {
                return;
            }
            if (event is MouseEventEx)
            {
                FocusManager.setFocus(this.textField, (event as MouseEventEx).mouseIdx);
            }
            else
            {
                stage.focus = this.textField;
            }
            return;
        }// end function

        protected function handleTextChange(event:Event) : void
        {
            if (this._maxByte != 0)
            {
                if (this._maxByte < this.GetTextByte())
                {
                    this.updateText();
                    return;
                }
            }
            this._text = this._isHtml ? (this.textField.htmlText) : (this.textField.text);
            dispatchEventAndSound(new Event(Event.CHANGE));
            this.TrimHtmlTag();
            return;
        }// end function

        public function SetSelection(param1:int, param2:int) : void
        {
            this.updateText();
            this.textField.setSelection(param1, param2);
            return;
        }// end function

        protected function GetTextByte() : uint
        {
            var _loc_3:* = 0;
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            while (_loc_2 < this.textField.text.length)
            {
                
                _loc_3 = this.textField.text.charCodeAt(_loc_2);
                if (_loc_3 > 255)
                {
                    _loc_1 = _loc_1 + 2;
                }
                else
                {
                    _loc_1 = _loc_1 + 1;
                }
                _loc_2++;
            }
            return _loc_1;
        }// end function

    }
}
