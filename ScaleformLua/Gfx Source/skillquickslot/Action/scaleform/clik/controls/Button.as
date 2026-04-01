package scaleform.clik.controls
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.text.*;
    import flash.utils.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;
    import scaleform.gfx.*;

    public class Button extends UIComponent
    {
        public var lockDragStateChange:Boolean = false;
        public var repeatDelay:Number = 500;
        public var repeatInterval:Number = 200;
        public var constraintsDisabled:Boolean = false;
        public var allowDeselect:Boolean = true;
        public var preventAutosizing:Boolean = false;
        public var fakeDisable:Boolean = false;
        public var fakeOver:Boolean = false;
        protected var _toggle:Boolean = false;
        protected var _label:String;
        protected var _state:String;
        protected var _group:ButtonGroup;
        protected var _groupName:String;
        protected var _selected:Boolean = false;
        protected var _data:Object;
        protected var _autoRepeat:Boolean = false;
        protected var _autoSize:String = "none";
        protected var _pressedByKeyboard:Boolean = false;
        protected var _isRepeating:Boolean = false;
        protected var _owner:UIComponent = null;
        protected var _stateMap:Object;
        protected var _newFrame:String;
        protected var _newFocusIndicatorFrame:String;
        protected var _repeatTimer:Timer;
        protected var _mouseDown:int = 0;
        protected var _focusIndicatorLabelHash:Object;
        protected var _autoRepeatEvent:ButtonEvent;
        public var textField:TextField;
        public var defaultTextFormat:TextFormat;
        public var mcOverlay:MovieClip;
        protected var _focusIndicator:MovieClip;
        protected var isHTMLLabel:Boolean = false;
        protected var _mcOverlayImg:MovieClip;
        protected var _overlayImg:String = "";
        protected var _overlayConstraints:uint = 0;
        protected var _overlayPadding:Object;
        protected var _overlayOrigW:int = 0;
        protected var _overlayOrigH:int = 0;
        protected var statesDefault:Vector.<String>;
        protected var statesSelected:Vector.<String>;

        public function Button()
        {
            this._stateMap = {up:["up"], over:["over"], down:["down"], release:["release", "over"], out:["out", "up"], disabled:["disabled"], selecting:["selecting", "over"], toggle:["toggle", "up"], kb_selecting:["kb_selecting", "up"], kb_release:["kb_release", "out", "up"], kb_down:["kb_down", "down"]};
            this.statesDefault = this.Vector.<String>([""]);
            this.statesSelected = this.Vector.<String>(["selected_", ""]);
            buttonMode = true;
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
            tabEnabled = true;
            return;
        }// end function

        protected function OnUpdate(event:Event) : void
        {
            invalidate(InvalidationType.DATA, InvalidationType.STATE);
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(param1:Object) : void
        {
            this._data = param1;
            return;
        }// end function

        public function get autoRepeat() : Boolean
        {
            return this._autoRepeat;
        }// end function

        public function set autoRepeat(param1:Boolean) : void
        {
            this._autoRepeat = param1;
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            var _loc_2:* = null;
            super.enabled = param1;
            mouseChildren = false;
            if (super.enabled)
            {
                _loc_2 = this._focusIndicator == null && (_displayFocus || _focused) ? ("over") : ("up");
            }
            else
            {
                _loc_2 = "disabled";
            }
            this.setState(_loc_2);
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            super.focusable = false;
            return;
        }// end function

        public function get toggle() : Boolean
        {
            return this._toggle;
        }// end function

        public function set toggle(param1:Boolean) : void
        {
            this._toggle = param1;
            return;
        }// end function

        public function get owner() : UIComponent
        {
            return this._owner;
        }// end function

        public function set owner(param1:UIComponent) : void
        {
            this._owner = param1;
            return;
        }// end function

        public function get state() : String
        {
            return this._state;
        }// end function

        public function get selected() : Boolean
        {
            return this._selected;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            var _loc_2:* = false;
            if (this._selected == param1)
            {
                return;
            }
            this._selected = param1;
            if (this.enabled)
            {
                if (!_focused)
                {
                    this.setState("toggle");
                }
                else if (this._pressedByKeyboard && this._focusIndicator != null)
                {
                }
                else
                {
                    this.setState("selecting");
                }
                if (this.owner)
                {
                    _loc_2 = this._selected && this.owner != null && this.checkOwnerFocused();
                    this.setState(_loc_2 && this._focusIndicator == null ? ("selecting") : ("toggle"));
                    displayFocus = _loc_2;
                }
            }
            else
            {
                this.setState("disabled");
            }
            validateNow();
            dispatchEventAndSound(new Event(Event.SELECT));
            return;
        }// end function

        public function get group() : ButtonGroup
        {
            return this._group;
        }// end function

        public function set group(param1:ButtonGroup) : void
        {
            if (this._group != null)
            {
                this._group.removeButton(this);
                removeEventListener(Event.REMOVED_FROM_STAGE, this.removeFromButtonGroup);
            }
            this._group = param1;
            if (this._group != null)
            {
                this._group.addButton(this);
                addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromButtonGroup, false, 0, true);
            }
            return;
        }// end function

        public function get groupName() : String
        {
            return this._groupName;
        }// end function

        public function set groupName(param1:String) : void
        {
            if (_inspector && param1 == "")
            {
                this.allowDeselect = true;
                return;
            }
            if (this._groupName == param1)
            {
                return;
            }
            this.allowDeselect = false;
            if (param1 != null)
            {
                addEventListener(Event.ADDED, this.addToAutoGroup, false, 0, true);
                addEventListener(Event.REMOVED, this.addToAutoGroup, false, 0, true);
            }
            else
            {
                removeEventListener(Event.ADDED, this.addToAutoGroup, false);
                removeEventListener(Event.REMOVED, this.addToAutoGroup, false);
            }
            this._groupName = param1;
            this.addToAutoGroup(null);
            return;
        }// end function

        public function get label() : String
        {
            return this._label;
        }// end function

        public function set label(param1:String) : void
        {
            if (this._label == param1)
            {
                return;
            }
            this.isHTMLLabel = false;
            this._label = param1;
            invalidateData();
            return;
        }// end function

        public function get htmlLabel() : String
        {
            return this._label;
        }// end function

        public function set htmlLabel(param1:String) : void
        {
            if (this._label == param1)
            {
                return;
            }
            this.isHTMLLabel = true;
            this._label = param1;
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

        public function get focusIndicator() : MovieClip
        {
            return this._focusIndicator;
        }// end function

        public function set focusIndicator(param1:MovieClip) : void
        {
            this._focusIndicatorLabelHash = null;
            this._focusIndicator = param1;
            this._focusIndicatorLabelHash = UIComponent.generateLabelHash(this._focusIndicator);
            return;
        }// end function

        public function get overlayImg() : String
        {
            return this._overlayImg;
        }// end function

        public function set overlayImg(param1:String) : void
        {
            var _loc_4:* = null;
            if (param1 == this._overlayImg)
            {
                return;
            }
            if (this.mcOverlay == null)
            {
                trace("Warnning : " + this.name + " - overlayImg는 mcOverlay 무비클립 인스턴스를 가지고 있어야 사용할 수 있습니다.");
                return;
            }
            if (this._mcOverlayImg != null)
            {
                this.mcOverlay.removeChild(this._mcOverlayImg);
            }
            this._overlayImg = param1;
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            var _loc_3:* = _loc_2.getDefinition(param1) as Class;
            this._mcOverlayImg = new _loc_3 as MovieClip;
            if (this._mcOverlayImg == null)
            {
                trace("Warnning : " + this.name + " - overlayImg는 반드시 무비클립이어야 합니다.");
                return;
            }
            if (this.mcOverlay.scale9Grid == null)
            {
                _loc_4 = new Rectangle(0, 0, this._mcOverlayImg.width, this._mcOverlayImg.height);
                this.mcOverlay.scale9Grid = _loc_4;
            }
            this.mcOverlay.addChild(this._mcOverlayImg);
            this._overlayOrigW = this._mcOverlayImg.scaleX;
            this._overlayOrigH = this._mcOverlayImg.scaleY;
            return;
        }// end function

        public function set overlayAlign(param1:String) : void
        {
            if (param1 == "none")
            {
                this._overlayConstraints = Constraints.LEFT | Constraints.TOP;
            }
            else if (param1 == "vertical")
            {
                this._overlayConstraints = Constraints.LEFT | Constraints.CENTER_V;
            }
            else if (param1 == "horizontal")
            {
                this._overlayConstraints = Constraints.TOP | Constraints.CENTER_H;
            }
            else if (param1 == "vertical & horizontal")
            {
                this._overlayConstraints = Constraints.CENTER_H | Constraints.CENTER_V;
            }
            return;
        }// end function

        public function set overlayPadding(param1:Object) : void
        {
            this._overlayPadding = param1;
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.isDefaultPrevented())
            {
                return;
            }
            var _loc_2:* = event.details;
            var _loc_3:* = _loc_2.controllerIndex;
            switch(_loc_2.navEquivalent)
            {
                case NavigationCode.ENTER:
                {
                    if (_loc_2.value == InputValue.KEY_DOWN)
                    {
                        this.handlePress(_loc_3);
                        event.handled = true;
                    }
                    else if (_loc_2.value == InputValue.KEY_UP)
                    {
                        if (this._pressedByKeyboard)
                        {
                            this.handleRelease(_loc_3);
                            event.handled = true;
                        }
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK Button " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            if (this.constraintsDisabled == false)
            {
                if (constraints.getElement("textField") == null)
                {
                    constraints.addElement("textField", this.textField, Constraints.ALL);
                }
            }
            super.configUI();
            tabEnabled = _focusable && this.enabled && tabEnabled;
            var _loc_1:* = false;
            tabChildren = false;
            mouseChildren = _loc_1;
            this.focusable = false;
            addEventListener(MouseEvent.ROLL_OVER, this.handleMouseRollOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.handleMouseRollOut, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, this.handleMousePress, false, 0, true);
            addEventListener(MouseEvent.CLICK, this.handleMouseRelease, false, 0, true);
            addEventListener(MouseEvent.DOUBLE_CLICK, this.handleMouseRelease, false, 0, true);
            addEventListener(InputEvent.INPUT, this.handleInput, false, 0, true);
            if (this._focusIndicator != null && !_focused && this._focusIndicator.totalFrames == 1)
            {
                this.focusIndicator.visible = false;
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
                if (this._newFocusIndicatorFrame)
                {
                    this.focusIndicator.gotoAndPlay(this._newFocusIndicatorFrame);
                    this._newFocusIndicatorFrame = null;
                }
                this.updateAfterStateChange();
                dispatchEventAndSound(new ComponentEvent(ComponentEvent.STATE_CHANGE));
                invalidate(InvalidationType.DATA, InvalidationType.SIZE);
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateText();
                if (this.autoSize != TextFieldAutoSize.NONE)
                {
                    invalidateSize();
                }
            }
            if (isInvalid(InvalidationType.SIZE))
            {
                if (!this.preventAutosizing)
                {
                    this.alignForAutoSize();
                    setActualSize(_width, _height);
                }
                if (!this.constraintsDisabled)
                {
                    constraints.update(_width, _height);
                }
                if (this._mcOverlayImg != null)
                {
                    this._mcOverlayImg.scaleX = this._overlayOrigW / this.scaleX;
                    this._mcOverlayImg.scaleY = this._overlayOrigH / this.scaleY;
                    if (this._overlayConstraints & Constraints.LEFT)
                    {
                        this._mcOverlayImg.x = Math.floor(this._overlayPadding.x / this.scaleX);
                    }
                    if (this._overlayConstraints & Constraints.TOP)
                    {
                        this._mcOverlayImg.y = Math.floor(this._overlayPadding.y / this.scaleY);
                    }
                    if (this._overlayConstraints & Constraints.CENTER_H)
                    {
                        this._mcOverlayImg.x = Math.floor((this.width / this.scaleX - this._mcOverlayImg.width) / 2) + Math.floor(this._overlayPadding.x / this.scaleX);
                    }
                    if (this._overlayConstraints & Constraints.CENTER_V)
                    {
                        this._mcOverlayImg.y = Math.floor((this.height / this.scaleY - this._mcOverlayImg.height) / 2) + Math.floor(this._overlayPadding.y / this.scaleY);
                    }
                }
            }
            return;
        }// end function

        protected function addToAutoGroup(event:Event) : void
        {
            if (parent == null)
            {
                this.group = null;
                return;
            }
            var _loc_2:* = ButtonGroup.getGroup(this._groupName, parent);
            if (_loc_2 == this.group)
            {
                return;
            }
            this.group = _loc_2;
            return;
        }// end function

        protected function removeFromButtonGroup(event:Event) : void
        {
            this.group = null;
            return;
        }// end function

        protected function checkOwnerFocused() : Boolean
        {
            var _loc_2:* = null;
            var _loc_1:* = false;
            if (this.owner != null)
            {
                _loc_1 = this._owner.focused != 0;
                if (_loc_1 == 0)
                {
                    _loc_2 = this._owner.focusTarget;
                    if (_loc_2 != null)
                    {
                        _loc_1 = _loc_2 != 0;
                    }
                }
            }
            return _loc_1;
        }// end function

        protected function calculateWidth() : Number
        {
            var _loc_2:* = null;
            var _loc_1:* = actualWidth;
            if (!this.constraintsDisabled)
            {
                _loc_2 = constraints.getElement("textField");
                _loc_1 = Math.ceil(this.textField.textWidth + _loc_2.left + _loc_2.right + 5);
            }
            return _loc_1;
        }// end function

        protected function alignForAutoSize() : void
        {
            var _loc_1:* = NaN;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            if (!initialized || this._autoSize == TextFieldAutoSize.NONE || this.textField == null)
            {
                return;
            }
            _loc_1 = _width;
            var _loc_5:* = this.calculateWidth();
            _width = this.calculateWidth();
            var _loc_2:* = _loc_5;
            switch(this._autoSize)
            {
                case TextFieldAutoSize.RIGHT:
                {
                    _loc_3 = x + _loc_1;
                    x = _loc_3 - _loc_2;
                    break;
                }
                case TextFieldAutoSize.CENTER:
                {
                    _loc_4 = x + _loc_1 * 0.5;
                    x = _loc_4 - _loc_2 * 0.5;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_1:* = NaN;
            var _loc_2:* = 0;
            if (this._label != null && this.textField != null)
            {
                if (this.isHTMLLabel == true)
                {
                    this.textField.htmlText = this._label;
                }
                else
                {
                    this.textField.text = this._label;
                }
                if (this.autoSize == TextFieldAutoSize.NONE)
                {
                    _loc_1 = this.textField.width * this.scaleX;
                    if (_loc_1 < this.textField.textWidth)
                    {
                        TooltipHtmlText = this._label;
                        _loc_2 = 0;
                        while (_loc_2 < this._label.length)
                        {
                            
                            this.textField.text = this._label.substr(0, this._label.length - _loc_2) + "...";
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
            return;
        }// end function

        override protected function changeFocus() : void
        {
            var _loc_1:* = null;
            if (!this.enabled)
            {
                return;
            }
            if (this._focusIndicator == null)
            {
                this.setState(_focused || _displayFocus ? ("over") : ("out"));
                if (this._pressedByKeyboard && !_focused)
                {
                    this._pressedByKeyboard = false;
                }
            }
            else
            {
                if (this._focusIndicator.totalframes == 1)
                {
                    this._focusIndicator.visible = _focused > 0;
                }
                else
                {
                    _loc_1 = "state" + _focused;
                    if (this._focusIndicatorLabelHash[_loc_1])
                    {
                        this._newFocusIndicatorFrame = "state" + _focused;
                    }
                    else
                    {
                        this._newFocusIndicatorFrame = _focused || _displayFocus ? ("show") : ("hide");
                    }
                    invalidateState();
                }
                if (this._pressedByKeyboard && !_focused)
                {
                    this._pressedByKeyboard = false;
                }
            }
            return;
        }// end function

        protected function handleMouseRollOver(event:MouseEvent) : void
        {
            if (this._state == "disabled" && this.fakeDisable == true)
            {
                return;
            }
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            if (event.buttonDown)
            {
                dispatchEventAndSound(new ButtonEvent(ButtonEvent.DRAG_OVER));
                if (!this.enabled)
                {
                    return;
                }
                if (this.lockDragStateChange && Boolean(this._mouseDown << _loc_3 & 1))
                {
                    return;
                }
                if (_focused || _displayFocus)
                {
                    this.setState(this.focusIndicator == null ? ("down") : ("kb_down"));
                }
                else
                {
                    this.setState("over");
                }
            }
            else
            {
                if (!this.enabled)
                {
                    return;
                }
                if (_focused || _displayFocus)
                {
                    if (this._focusIndicator != null)
                    {
                        this.setState("over");
                    }
                }
                else
                {
                    this.setState("over");
                }
            }
            return;
        }// end function

        protected function handleMouseRollOut(event:MouseEvent) : void
        {
            if (this._state == "disabled")
            {
                if (this.fakeDisable == true || this.fakeOver == true)
                {
                    return;
                }
            }
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            if (event.buttonDown)
            {
                dispatchEventAndSound(new ButtonEvent(ButtonEvent.DRAG_OUT));
                if (Boolean(this._mouseDown & 1 << _loc_3))
                {
                    if (stage != null)
                    {
                        stage.addEventListener(MouseEvent.MOUSE_UP, this.handleReleaseOutside, false, 0, true);
                    }
                }
                if (this.lockDragStateChange || !this.enabled)
                {
                    return;
                }
                if (_focused || _displayFocus)
                {
                    this.setState(this._focusIndicator == null ? ("release") : ("kb_release"));
                }
                else
                {
                    this.setState("out");
                }
            }
            else
            {
                if (!this.enabled)
                {
                    return;
                }
                if (_focused || _displayFocus)
                {
                    if (this._focusIndicator != null)
                    {
                        this.setState("out");
                    }
                }
                else
                {
                    this.setState("out");
                }
            }
            return;
        }// end function

        protected function handleMousePress(event:MouseEvent) : void
        {
            var _loc_5:* = null;
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            var _loc_4:* = _loc_2 == null ? (0) : (_loc_2.buttonIdx);
            if ((_loc_2 == null ? (0) : (_loc_2.buttonIdx)) != 0)
            {
                return;
            }
            this._mouseDown = this._mouseDown | 1 << _loc_3;
            if (this.enabled)
            {
                this.setState("down");
                if (this.autoRepeat && this._repeatTimer == null)
                {
                    this._autoRepeatEvent = new ButtonEvent(ButtonEvent.CLICK, true, false, _loc_3, _loc_4, false, true);
                    this._repeatTimer = new Timer(this.repeatDelay, 1);
                    this._repeatTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat, false, 0, true);
                    this._repeatTimer.start();
                }
                _loc_5 = new ButtonEvent(ButtonEvent.PRESS, true, false, _loc_3, _loc_4, false, false);
                dispatchEventAndSound(_loc_5);
            }
            return;
        }// end function

        protected function handleMouseRelease(event:MouseEvent) : void
        {
            var _loc_5:* = null;
            this._autoRepeatEvent = null;
            if (!this.enabled)
            {
                return;
            }
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            var _loc_4:* = _loc_2 == null ? (0) : (_loc_2.buttonIdx);
            if ((_loc_2 == null ? (0) : (_loc_2.buttonIdx)) != 0)
            {
                return;
            }
            this._mouseDown = this._mouseDown ^ 1 << _loc_3;
            if (this._mouseDown == 0 && this._repeatTimer)
            {
                this._repeatTimer.stop();
                this._repeatTimer.reset();
                this._repeatTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat);
                this._repeatTimer.removeEventListener(TimerEvent.TIMER, this.handleRepeat);
                this._repeatTimer = null;
            }
            this.setState("release");
            this.handleClick(_loc_3);
            if (!this._isRepeating)
            {
                _loc_5 = new ButtonEvent(ButtonEvent.CLICK, true, false, _loc_3, _loc_4, false, false);
                dispatchEventAndSound(_loc_5);
            }
            this._isRepeating = false;
            return;
        }// end function

        protected function handleReleaseOutside(event:MouseEvent) : void
        {
            this._autoRepeatEvent = null;
            if (contains(event.target as DisplayObject))
            {
                return;
            }
            var _loc_2:* = event as MouseEventEx;
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.mouseIdx);
            var _loc_4:* = _loc_2 == null ? (0) : (_loc_2.buttonIdx);
            if ((_loc_2 == null ? (0) : (_loc_2.buttonIdx)) != 0)
            {
                return;
            }
            if (stage)
            {
                stage.removeEventListener(MouseEvent.MOUSE_UP, this.handleReleaseOutside, false);
            }
            this._mouseDown = this._mouseDown ^ 1 << _loc_3;
            dispatchEventAndSound(new ButtonEvent(ButtonEvent.RELEASE_OUTSIDE));
            if (!this.enabled)
            {
                return;
            }
            if (this.lockDragStateChange)
            {
                if (_focused || _displayFocus)
                {
                    this.setState(this.focusIndicator == null ? ("release") : ("kb_release"));
                }
            }
            return;
        }// end function

        protected function handlePress(param1:uint = 0) : void
        {
            if (!this.enabled)
            {
                return;
            }
            this._pressedByKeyboard = true;
            this.setState(this._focusIndicator == null ? ("down") : ("kb_down"));
            if (this.autoRepeat && this._repeatTimer == null)
            {
                this._autoRepeatEvent = new ButtonEvent(ButtonEvent.CLICK, true, false, param1, 0, true, true);
                this._repeatTimer = new Timer(this.repeatDelay, 1);
                this._repeatTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat, false, 0, true);
                this._repeatTimer.start();
            }
            var _loc_2:* = new ButtonEvent(ButtonEvent.PRESS, true, false, param1, 0, true, false);
            dispatchEventAndSound(_loc_2);
            return;
        }// end function

        protected function handleRelease(param1:uint = 0) : void
        {
            var _loc_2:* = null;
            if (!this.enabled)
            {
                return;
            }
            this.setState(this.focusIndicator == null ? ("release") : ("kb_release"));
            if (this._repeatTimer)
            {
                this._repeatTimer.stop();
                this._repeatTimer.reset();
                this._repeatTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat);
                this._repeatTimer.removeEventListener(TimerEvent.TIMER, this.handleRepeat);
                this._repeatTimer = null;
            }
            this.handleClick(param1);
            this._pressedByKeyboard = false;
            if (!this._isRepeating)
            {
                _loc_2 = new ButtonEvent(ButtonEvent.CLICK, true, false, param1, 0, true, false);
                dispatchEventAndSound(_loc_2);
            }
            this._isRepeating = false;
            return;
        }// end function

        protected function handleClick(param1:uint = 0) : void
        {
            if (this.toggle && (!this.selected || this.allowDeselect))
            {
                this.selected = !this.selected;
            }
            return;
        }// end function

        protected function beginRepeat(event:TimerEvent) : void
        {
            this._repeatTimer.delay = this.repeatInterval;
            this._repeatTimer.repeatCount = 0;
            this._repeatTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat);
            this._repeatTimer.addEventListener(TimerEvent.TIMER, this.handleRepeat, false, 0, true);
            this._repeatTimer.reset();
            this._repeatTimer.start();
            return;
        }// end function

        protected function handleRepeat(event:TimerEvent) : void
        {
            if (this._mouseDown == 0 && !this._pressedByKeyboard)
            {
                this._repeatTimer.stop();
                this._repeatTimer.reset();
                this._repeatTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.beginRepeat);
                this._repeatTimer.removeEventListener(TimerEvent.TIMER, this.handleRepeat);
                this._repeatTimer = null;
            }
            if (this._autoRepeatEvent)
            {
                this._isRepeating = true;
                dispatchEventAndSound(this._autoRepeatEvent);
            }
            return;
        }// end function

        public function setState(param1:String) : void
        {
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            var _loc_9:* = null;
            this._state = param1;
            var _loc_2:* = this.getStatePrefixes();
            var _loc_3:* = this._stateMap[param1];
            if (_loc_3 == null || _loc_3.length == 0)
            {
                return;
            }
            var _loc_4:* = _loc_2.length;
            var _loc_5:* = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_6 = _loc_2[_loc_5];
                _loc_7 = _loc_3.length;
                _loc_8 = 0;
                while (_loc_8 < _loc_7)
                {
                    
                    _loc_9 = _loc_6 + _loc_3[_loc_8];
                    if (_labelHash[_loc_9])
                    {
                        this._newFrame = _loc_9;
                        invalidateState();
                        return;
                    }
                    _loc_8 = _loc_8 + 1;
                }
                _loc_5 = _loc_5 + 1;
            }
            return;
        }// end function

        protected function getStatePrefixes() : Vector.<String>
        {
            return this._selected ? (this.statesSelected) : (this.statesDefault);
        }// end function

        protected function updateAfterStateChange() : void
        {
            if (!initialized)
            {
                return;
            }
            if (constraints != null && !this.constraintsDisabled)
            {
                if (this.mcOverlay != null)
                {
                    constraints.updateElement("mcOverlayImg", this._mcOverlayImg);
                }
                if (this.textField != null)
                {
                    constraints.updateElement("textField", this.textField);
                }
            }
            return;
        }// end function

        override protected function onRollOverTooltip(event:MouseEvent) : void
        {
            if (_tooltipText == "")
            {
                return;
            }
            if (stage == null)
            {
                return;
            }
            var _loc_2:* = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
            _loc_2.localX = this.x;
            _loc_2.localY = this.y;
            _loc_2.component = this;
            var _loc_3:* = this.parent;
            while (_loc_3 != null)
            {
                
                _loc_2.localX = _loc_2.localX + _loc_3.x;
                _loc_2.localY = _loc_2.localY + _loc_3.y;
                _loc_3 = _loc_3.parent;
            }
            _loc_2.tooltip = this.TooltipText;
            _loc_2.htmlText = this._isHtmlTooltipText;
            stage.dispatchEvent(_loc_2);
            return;
        }// end function

        override protected function onRollOutTooltip(event:MouseEvent) : void
        {
            if (_tooltipText == "")
            {
                return;
            }
            if (stage == null)
            {
                return;
            }
            var _loc_2:* = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
            _loc_2.localX = this.x;
            _loc_2.localY = this.y;
            _loc_2.component = this;
            var _loc_3:* = this.parent;
            while (_loc_3 != null)
            {
                
                _loc_2.localX = _loc_2.localX + _loc_3.x;
                _loc_2.localY = _loc_2.localY + _loc_3.y;
                _loc_3 = _loc_3.parent;
            }
            _loc_2.tooltip = this.TooltipText;
            _loc_2.htmlText = this._isHtmlTooltipText;
            stage.dispatchEvent(_loc_2);
            return;
        }// end function

    }
}
