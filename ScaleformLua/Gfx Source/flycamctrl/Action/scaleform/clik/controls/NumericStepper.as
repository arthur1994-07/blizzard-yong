package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class NumericStepper extends UIComponent
    {
        public var stepSize:Number = 1;
        public var constraintsDisabled:Boolean = false;
        protected var _maximum:Number = 10;
        protected var _minimum:Number = 0;
        protected var _stepSize:Number;
        protected var _value:Number = 0;
        protected var _labelFunction:Function;
        protected var state:String = "default";
        protected var _newFrame:String;
        public var textField:TextField;
        public var nextBtn:Button;
        public var prevBtn:Button;
        public var container:MovieClip;

        public function NumericStepper()
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
            tabEnabled = param1;
            mouseEnabled = _loc_2;
            gotoAndPlay(param1 ? (_focused > 0 ? ("focused") : ("default")) : ("disabled"));
            if (!initialized)
            {
                return;
            }
            this.updateAfterStateChange();
            var _loc_2:* = param1;
            this.nextBtn.enabled = param1;
            this.prevBtn.enabled = _loc_2;
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            super.focusable = param1;
            return;
        }// end function

        public function get maximum() : Number
        {
            return this._maximum;
        }// end function

        public function set maximum(param1:Number) : void
        {
            this._maximum = param1;
            param1 = this._value;
            return;
        }// end function

        public function get minimum() : Number
        {
            return this._minimum;
        }// end function

        public function set minimum(param1:Number) : void
        {
            this._minimum = param1;
            param1 = this._value;
            return;
        }// end function

        public function get value() : Number
        {
            return this._value;
        }// end function

        public function set value(param1:Number) : void
        {
            param1 = this.lockValue(param1);
            if (param1 == this._value)
            {
                return;
            }
            var _loc_2:* = this._value;
            this._value = param1;
            if (initialized)
            {
                dispatchEventAndSound(new IndexEvent(IndexEvent.INDEX_CHANGE, true, false, this.value, _loc_2, null));
            }
            invalidate();
            return;
        }// end function

        public function get labelFunction() : Function
        {
            return this._labelFunction;
        }// end function

        public function set labelFunction(param1:Function) : void
        {
            this._labelFunction = param1;
            this.updateLabel();
            return;
        }// end function

        public function increment() : void
        {
            this.onNext(null);
            return;
        }// end function

        public function decrement() : void
        {
            this.onPrev(null);
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
            var _loc_4:* = _loc_2.value == InputValue.KEY_DOWN || _loc_2.value == InputValue.KEY_HOLD;
            switch(_loc_2.navEquivalent)
            {
                case NavigationCode.RIGHT:
                {
                    if (this._value < this._maximum)
                    {
                        if (_loc_4)
                        {
                            this.onNext(null);
                        }
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.LEFT:
                {
                    if (this._value > this._minimum)
                    {
                        if (_loc_4)
                        {
                            this.onPrev(null);
                        }
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.HOME:
                {
                    if (!_loc_4)
                    {
                        this.value = this._minimum;
                    }
                    event.handled = true;
                    break;
                }
                case NavigationCode.END:
                {
                    if (!_loc_4)
                    {
                        this.value = this._maximum;
                    }
                    event.handled = true;
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
            return "[CLIK NumericStepper " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            if (!this.constraintsDisabled)
            {
                constraints.addElement("textField", this.textField, Constraints.LEFT | Constraints.RIGHT);
            }
            addEventListener(InputEvent.INPUT, this.handleInput, false, 0, true);
            this.nextBtn.addEventListener(ButtonEvent.CLICK, this.onNext, false, 0, true);
            this.prevBtn.addEventListener(ButtonEvent.CLICK, this.onPrev, false, 0, true);
            tabEnabled = _focusable;
            tabChildren = false;
            if (this.textField != null)
            {
                var _loc_1:* = false;
                this.textField.mouseEnabled = false;
                this.textField.tabEnabled = _loc_1;
            }
            if (this.container != null)
            {
                var _loc_1:* = false;
                this.container.mouseEnabled = false;
                this.container.tabEnabled = _loc_1;
            }
            var _loc_1:* = this.enabled;
            this.nextBtn.enabled = this.enabled;
            this.prevBtn.enabled = _loc_1;
            var _loc_1:* = true;
            this.nextBtn.autoRepeat = true;
            this.prevBtn.autoRepeat = _loc_1;
            var _loc_1:* = false;
            this.nextBtn.focusable = false;
            this.prevBtn.focusable = _loc_1;
            var _loc_1:* = this;
            this.nextBtn.focusTarget = this;
            this.prevBtn.focusTarget = _loc_1;
            var _loc_1:* = false;
            this.nextBtn.tabEnabled = false;
            this.prevBtn.tabEnabled = _loc_1;
            var _loc_1:* = true;
            this.nextBtn.mouseEnabled = true;
            this.prevBtn.mouseEnabled = _loc_1;
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
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateLabel();
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
            if (_focused || _displayFocus)
            {
                this.setState("focused", "default");
            }
            else
            {
                this.setState("default");
            }
            this.updateAfterStateChange();
            var _loc_1:* = _focused > 0;
            this.nextBtn.displayFocus = _focused > 0;
            this.prevBtn.displayFocus = _loc_1;
            return;
        }// end function

        protected function handleDataChange(event:Event) : void
        {
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        protected function updateAfterStateChange() : void
        {
            invalidateSize();
            this.updateLabel();
            if (this.textField != null)
            {
                var _loc_1:* = false;
                this.textField.mouseEnabled = false;
                this.textField.tabEnabled = _loc_1;
            }
            if (this.container != null)
            {
                var _loc_1:* = false;
                this.container.mouseEnabled = false;
                this.container.tabEnabled = _loc_1;
            }
            if (constraints != null && !this.constraintsDisabled)
            {
                constraints.updateElement("textField", this.textField);
            }
            return;
        }// end function

        protected function updateLabel() : void
        {
            var _loc_1:* = this._value.toString();
            if (this._labelFunction != null)
            {
                _loc_1 = this._labelFunction(this._value);
            }
            this.textField.text = _loc_1;
            return;
        }// end function

        protected function onNext(event:ButtonEvent) : void
        {
            this.value = this._value + this.stepSize;
            return;
        }// end function

        protected function onPrev(event:ButtonEvent) : void
        {
            this.value = this._value - this.stepSize;
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

        protected function lockValue(param1:Number) : Number
        {
            var _loc_2:* = Math.max(this._minimum, Math.min(this._maximum, this.stepSize * Math.round(param1 / this.stepSize)));
            return _loc_2;
        }// end function

    }
}
