package ran.ui.core
{
    import flash.geom.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;

    public class MColorView extends UIComponent
    {
        public var btnColor:Button;
        public var textField:TextField;
        private var _nR:uint = 0;
        private var _nG:uint = 0;
        private var _nB:uint = 0;
        private var _nXColor:uint = 0;
        private var _text:String = "";

        public function MColorView()
        {
            return;
        }// end function

        public function set color(param1:uint) : void
        {
            this._nR = (param1 & 16711680) >> 16;
            this._nG = (param1 & 65280) >> 8;
            this._nB = param1 & 255;
            this.ChangeColor();
            return;
        }// end function

        public function get color() : uint
        {
            return this._nXColor;
        }// end function

        public function set redColor(param1:uint) : void
        {
            if (param1 > 255)
            {
                param1 = 255;
            }
            this._nR = param1;
            this.ChangeColor();
            return;
        }// end function

        public function get redColor() : uint
        {
            return this._nR;
        }// end function

        public function set greenColor(param1:uint) : void
        {
            if (param1 > 255)
            {
                param1 = 255;
            }
            this._nG = param1;
            this.ChangeColor();
            return;
        }// end function

        public function get greenColor() : uint
        {
            return this._nG;
        }// end function

        public function set blueColor(param1:uint) : void
        {
            if (param1 > 255)
            {
                param1 = 255;
            }
            this._nB = param1;
            this.ChangeColor();
            return;
        }// end function

        public function get blueColor() : uint
        {
            return this._nB;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            if (param1 == true)
            {
                gotoAndPlay("default");
                this.btnColor.mouseEnabled = true;
                this.btnColor.mouseChildren = true;
            }
            else
            {
                gotoAndPlay("disabled");
                this.btnColor.mouseEnabled = false;
                this.btnColor.mouseChildren = false;
            }
            this.textField.text = this._text;
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(param1:String) : void
        {
            this._text = param1;
            this.textField.text = this._text;
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            this.textField.mouseEnabled = false;
            return;
        }// end function

        private function ChangeColor() : void
        {
            var _loc_1:* = this.btnColor["mcColorBox"].transform.colorTransform;
            _loc_1.redOffset = this._nR;
            _loc_1.greenOffset = this._nG;
            _loc_1.blueOffset = this._nB;
            this.btnColor["mcColorBox"].transform.colorTransform = _loc_1;
            this._nXColor = (this._nB << 0) + (this._nG << 8) + (this._nR << 16) + (255 << 24);
            dispatchEvent(new ColorChangeEvent(ColorChangeEvent.COLOR_CHANGE, this._nXColor));
            return;
        }// end function

    }
}
