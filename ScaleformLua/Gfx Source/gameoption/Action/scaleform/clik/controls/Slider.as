package scaleform.clik.controls
{
    import flash.events.*;
    import flash.geom.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class Slider extends UIComponent
    {
        public var liveDragging:Boolean = true;
        public var state:String = "default";
        public var offsetLeft:Number = 0;
        public var offsetRight:Number = 0;
        protected var _minimum:Number = 0;
        protected var _maximum:Number = 10;
        protected var _value:Number = 0;
        protected var _snapInterval:Number = 1;
        protected var _snapping:Boolean = false;
        protected var _dragOffset:Object;
        protected var _trackDragMouseIndex:Number;
        protected var _trackPressed:Boolean = false;
        protected var _thumbPressed:Boolean = false;
        public var thumb:Button;
        public var track:Button;

        public function Slider()
        {
            return;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            tabChildren = false;
            var _loc_1:* = this.enabled;
            mouseChildren = this.enabled;
            mouseEnabled = _loc_1;
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
            this.track.enabled = param1;
            this.thumb.enabled = _loc_2;
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            super.focusable = param1;
            tabChildren = false;
            return;
        }// end function

        public function get value() : Number
        {
            return this._value;
        }// end function

        public function set value(param1:Number) : void
        {
            this._value = this.lockValue(param1);
            dispatchEventAndSound(new SliderEvent(SliderEvent.VALUE_CHANGE, false, true, this._value));
            this.draw();
            return;
        }// end function

        public function get maximum() : Number
        {
            return this._maximum;
        }// end function

        public function set maximum(param1:Number) : void
        {
            this._maximum = param1;
            return;
        }// end function

        public function get minimum() : Number
        {
            return this._minimum;
        }// end function

        public function set minimum(param1:Number) : void
        {
            this._minimum = param1;
            return;
        }// end function

        public function get position() : Number
        {
            return this._value;
        }// end function

        public function set position(param1:Number) : void
        {
            this._value = param1;
            return;
        }// end function

        public function get snapping() : Boolean
        {
            return this._snapping;
        }// end function

        public function set snapping(param1:Boolean) : void
        {
            this._snapping = param1;
            this.invalidateSettings();
            return;
        }// end function

        public function get snapInterval() : Number
        {
            return this._snapInterval;
        }// end function

        public function set snapInterval(param1:Number) : void
        {
            this._snapInterval = param1;
            this.invalidateSettings();
            return;
        }// end function

        public function invalidateSettings() : void
        {
            invalidate(InvalidationType.SETTINGS);
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
                    if (_loc_4)
                    {
                        this.value = this.value + this._snapInterval;
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.LEFT:
                {
                    if (_loc_4)
                    {
                        this.value = this.value - this._snapInterval;
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.HOME:
                {
                    if (!_loc_4)
                    {
                        this.value = this.minimum;
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.END:
                {
                    if (!_loc_4)
                    {
                        this.value = this.maximum;
                        event.handled = true;
                    }
                    break;
                }
                default:
                {
                    break;
                    break;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK Slider " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            addEventListener(InputEvent.INPUT, this.handleInput, false, 0, true);
            this.thumb.addEventListener(MouseEvent.MOUSE_DOWN, this.beginDrag, false, 0, true);
            this.track.addEventListener(MouseEvent.MOUSE_DOWN, this.trackPress, false, 0, true);
            tabEnabled = true;
            var _loc_1:* = this;
            this.track.focusTarget = this;
            this.thumb.focusTarget = _loc_1;
            var _loc_1:* = this.enabled;
            this.track.enabled = this.enabled;
            this.thumb.enabled = _loc_1;
            this.thumb.lockDragStateChange = true;
            constraints.addElement("track", this.track, Constraints.LEFT | Constraints.RIGHT);
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.STATE))
            {
                gotoAndPlay(!this.enabled ? ("disabled") : (_focused ? ("focused") : ("default")));
            }
            if (isInvalid(InvalidationType.SIZE))
            {
                setActualSize(_width, _height);
                constraints.update(_width, _height);
            }
            this.updateThumb();
            return;
        }// end function

        override protected function changeFocus() : void
        {
            super.changeFocus();
            invalidateState();
            if (this.enabled)
            {
                if (!this._thumbPressed)
                {
                    this.thumb.displayFocus = _focused != 0;
                }
                if (!this._trackPressed)
                {
                    this.track.displayFocus = _focused != 0;
                }
            }
            return;
        }// end function

        protected function updateThumb() : void
        {
            if (!this.enabled)
            {
                return;
            }
            var _loc_1:* = _width - this.offsetLeft - this.offsetRight;
            this.thumb.x = (this._value - this._minimum) / (this._maximum - this._minimum) * _loc_1 - this.thumb.width / 2 + this.offsetLeft;
            return;
        }// end function

        protected function beginDrag(event:MouseEvent) : void
        {
            this._thumbPressed = true;
            var _loc_2:* = globalToLocal(new Point(event.stageX, event.stageY));
            this._dragOffset = {x:_loc_2.x - this.thumb.x - this.thumb.width / 2};
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.doDrag, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.endDrag, false, 0, true);
            return;
        }// end function

        protected function doDrag(event:MouseEvent) : void
        {
            var _loc_2:* = globalToLocal(new Point(event.stageX, event.stageY));
            var _loc_3:* = _loc_2.x - this._dragOffset.x;
            var _loc_4:* = _width - this.offsetLeft - this.offsetRight;
            var _loc_5:* = this.lockValue((_loc_3 - this.offsetLeft) / _loc_4 * (this._maximum - this._minimum) + this._minimum);
            if (this.value == _loc_5)
            {
                return;
            }
            this._value = _loc_5;
            this.updateThumb();
            if (this.liveDragging)
            {
                dispatchEventAndSound(new SliderEvent(SliderEvent.VALUE_CHANGE, false, true, this._value));
            }
            return;
        }// end function

        protected function endDrag(event:MouseEvent) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.doDrag, false);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.endDrag, false);
            if (!this.liveDragging)
            {
                dispatchEventAndSound(new SliderEvent(SliderEvent.VALUE_CHANGE, false, true, this._value));
            }
            this._trackDragMouseIndex = undefined;
            this._thumbPressed = false;
            this._trackPressed = false;
            this.thumb.setState("up");
            this.track.setState("up");
            return;
        }// end function

        protected function trackPress(event:MouseEvent) : void
        {
            this._trackPressed = true;
            this.track.focused = _focused;
            var _loc_2:* = _width - this.offsetLeft - this.offsetRight;
            var _loc_3:* = this.lockValue((event.localX * scaleX - this.offsetLeft) / _loc_2 * (this._maximum - this._minimum) + this._minimum);
            if (this.value == _loc_3)
            {
                return;
            }
            this.value = _loc_3;
            if (!this.liveDragging)
            {
                dispatchEventAndSound(new SliderEvent(SliderEvent.VALUE_CHANGE, false, true, this._value));
            }
            this._trackDragMouseIndex = 0;
            this._dragOffset = {x:0};
            return;
        }// end function

        protected function lockValue(param1:Number) : Number
        {
            param1 = Math.max(this._minimum, Math.min(this._maximum, param1));
            if (!this.snapping)
            {
                return param1;
            }
            var _loc_2:* = Math.round(param1 / this.snapInterval) * this.snapInterval;
            return _loc_2;
        }// end function

        protected function scrollWheel(param1:Number) : void
        {
            if (_focused)
            {
                this.value = this.value - param1 * this._snapInterval;
                dispatchEventAndSound(new Event(Event.CHANGE));
            }
            return;
        }// end function

    }
}
