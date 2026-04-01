package scaleform.clik.controls
{
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;

    public class StatusIndicator extends UIComponent
    {
        protected var _maximum:Number = 10;
        protected var _minimum:Number = 0;
        protected var _value:Number = 0;

        public function StatusIndicator()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        public function get maximum() : Number
        {
            return this._maximum;
        }// end function

        public function set maximum(param1:Number) : void
        {
            this._maximum = param1;
            this.updatePosition();
            return;
        }// end function

        public function get minimum() : Number
        {
            return this._minimum;
        }// end function

        public function set minimum(param1:Number) : void
        {
            if (this._minimum == param1)
            {
                return;
            }
            this._minimum = param1;
            this.updatePosition();
            return;
        }// end function

        public function get value() : Number
        {
            return this._value;
        }// end function

        public function set value(param1:Number) : void
        {
            var _loc_2:* = Math.max(this._minimum, Math.min(this._maximum, param1));
            if (this._value == _loc_2)
            {
                return;
            }
            this._value = _loc_2;
            this.updatePosition();
            return;
        }// end function

        public function get position() : Number
        {
            return this._value;
        }// end function

        public function set position(param1:Number) : void
        {
            this.value = param1;
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK StatusIndicator " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            var _loc_1:* = false;
            focusable = false;
            tabEnabled = _loc_1;
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SIZE))
            {
                setActualSize(_width, _height);
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.updatePosition();
            }
            return;
        }// end function

        protected function updatePosition() : void
        {
            if (!enabled)
            {
                return;
            }
            var _loc_1:* = (this._value - this._minimum) / (this._maximum - this._minimum);
            gotoAndStop(Math.max(1, Math.round(_loc_1 * totalFrames)));
            return;
        }// end function

    }
}
