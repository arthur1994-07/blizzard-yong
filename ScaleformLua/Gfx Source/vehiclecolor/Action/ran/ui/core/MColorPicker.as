package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;

    public class MColorPicker extends UIComponent
    {
        public var mcColorBox:MovieClip;
        public var mcColorSelect:MovieClip;
        public var sliderR:Slider;
        public var sliderG:Slider;
        public var sliderB:Slider;
        public var tiRValue:TextInput;
        public var tiGValue:TextInput;
        public var tiBValue:TextInput;
        public var btnPalette:Button;
        private var palettePendingColor:uint = 0;
        private var paletteTileSize:uint = 0;
        private var paletteTileAcross:uint = 0;
        private var _nR:uint = 0;
        private var _nG:uint = 0;
        private var _nB:uint = 0;
        private var _nXColor:uint = 0;

        public function MColorPicker()
        {
            return;
        }// end function

        public function set color(param1:uint) : void
        {
            this._nR = (param1 & 16711680) >> 16;
            this._nG = (param1 & 65280) >> 8;
            this._nB = param1 & 255;
            this.sliderR.value = this._nR;
            this.sliderG.value = this._nG;
            this.sliderB.value = this._nB;
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
            this.sliderR.value = this._nR;
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
            this.sliderG.value = this._nG;
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
            this.sliderB.value = this._nB;
            return;
        }// end function

        public function get blueColor() : uint
        {
            return this._nB;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            this.mcColorSelect.visible = false;
            this.mcColorSelect.mouseEnabled = false;
            this.mcColorSelect.mouseChildren = false;
            this.paletteTileAcross = 18;
            this.paletteTileSize = this.btnPalette.width / this.paletteTileAcross;
            this.sliderR.maximum = 255;
            this.sliderR.minimum = 0;
            this.sliderR.value = this._nR;
            this.sliderG.maximum = 255;
            this.sliderG.minimum = 0;
            this.sliderG.value = this._nG;
            this.sliderB.maximum = 255;
            this.sliderB.minimum = 0;
            this.sliderB.value = this._nB;
            this.tiRValue.text = "" + this._nR;
            this.tiGValue.text = "" + this._nG;
            this.tiBValue.text = "" + this._nB;
            this.tiRValue.addEventListener(Event.CHANGE, this.onRInput, false, 0, true);
            this.tiGValue.addEventListener(Event.CHANGE, this.onGInput, false, 0, true);
            this.tiBValue.addEventListener(Event.CHANGE, this.onBInput, false, 0, true);
            this.sliderR.addEventListener(SliderEvent.VALUE_CHANGE, this.onRSliderChange, false, 0, true);
            this.sliderG.addEventListener(SliderEvent.VALUE_CHANGE, this.onGSliderChange, false, 0, true);
            this.sliderB.addEventListener(SliderEvent.VALUE_CHANGE, this.onBSliderChange, false, 0, true);
            this.btnPalette.addEventListener(MouseEvent.ROLL_OVER, this.onPaletteRollOver, false, 0, true);
            this.btnPalette.addEventListener(MouseEvent.ROLL_OUT, this.onPaletteRollOut, false, 0, true);
            this.btnPalette.addEventListener(MouseEvent.CLICK, this.onPaletteClick, false, 0, true);
            return;
        }// end function

        private function ChangeColor() : void
        {
            var _loc_1:* = this.mcColorBox.transform.colorTransform;
            _loc_1.redOffset = this._nR;
            _loc_1.greenOffset = this._nG;
            _loc_1.blueOffset = this._nB;
            this.mcColorBox.transform.colorTransform = _loc_1;
            this._nXColor = (this._nB << 0) + (this._nG << 8) + (this._nR << 16) + (255 << 24);
            dispatchEvent(new ColorChangeEvent(ColorChangeEvent.COLOR_CHANGE, this._nXColor));
            return;
        }// end function

        private function onRInput(event:Event) : void
        {
            if (this.tiRValue.text == "")
            {
                this.tiRValue.text = "0";
                this._nR = 0;
            }
            else
            {
                this._nR = int(this.tiRValue.text);
                if (this._nR > 255)
                {
                    this.tiRValue.text = "255";
                    this._nR = 255;
                }
                else if (this._nR < 0)
                {
                    this.tiRValue.text = "0";
                    this._nR = 0;
                }
            }
            this.sliderR.value = this._nR;
            return;
        }// end function

        private function onGInput(event:Event) : void
        {
            if (this.tiGValue.text == "")
            {
                this.tiGValue.text = "0";
                this._nG = 0;
            }
            else
            {
                this._nG = int(this.tiGValue.text);
                if (this._nG > 255)
                {
                    this.tiGValue.text = "255";
                    this._nG = 255;
                }
                else if (this._nG < 0)
                {
                    this.tiGValue.text = "0";
                    this._nG = 0;
                }
            }
            this.sliderG.value = this._nG;
            return;
        }// end function

        private function onBInput(event:Event) : void
        {
            if (this.tiBValue.text == "")
            {
                this.tiBValue.text = "0";
                this._nB = 0;
            }
            else
            {
                this._nB = int(this.tiBValue.text);
                if (this._nB > 255)
                {
                    this.tiBValue.text = "255";
                    this._nB = 255;
                }
                else if (this._nB < 0)
                {
                    this.tiBValue.text = "0";
                    this._nB = 0;
                }
            }
            this.sliderB.value = this._nB;
            return;
        }// end function

        private function onRSliderChange(event:SliderEvent) : void
        {
            this._nR = event.value;
            this.tiRValue.text = "" + this._nR;
            this.ChangeColor();
            return;
        }// end function

        private function onGSliderChange(event:SliderEvent) : void
        {
            this._nG = event.value;
            this.tiGValue.text = "" + this._nG;
            this.ChangeColor();
            return;
        }// end function

        private function onBSliderChange(event:SliderEvent) : void
        {
            this._nB = event.value;
            this.tiBValue.text = "" + this._nB;
            this.ChangeColor();
            return;
        }// end function

        private function onPaletteRollOver(event:MouseEvent) : void
        {
            this.btnPalette.addEventListener(MouseEvent.MOUSE_MOVE, this.onPaletteMouseMove, false, 0, true);
            this.mcColorSelect.visible = true;
            return;
        }// end function

        private function onPaletteRollOut(event:MouseEvent) : void
        {
            this.btnPalette.removeEventListener(MouseEvent.MOUSE_MOVE, this.onPaletteMouseMove);
            this.mcColorSelect.visible = false;
            return;
        }// end function

        private function onPaletteMouseMove(event:MouseEvent) : void
        {
            var _loc_2:* = Math.ceil(event.localX / this.paletteTileSize);
            var _loc_3:* = Math.ceil(event.localY / this.paletteTileSize);
            var _loc_4:* = (_loc_3 - 1) * this.paletteTileAcross + _loc_2 - 1;
            this.palettePendingColor = ((_loc_4 / 6 % 3 << 0) + (_loc_4 / 108 << 0) * 3) * 51 << 16 | _loc_4 % 6 * 51 << 8 | (_loc_4 / 18 << 0) % 6 * 51;
            _loc_2 = this.btnPalette.x + Math.floor((event.localX - 1) / this.paletteTileSize) * this.paletteTileSize;
            _loc_3 = this.btnPalette.y + Math.floor((event.localY - 1) / this.paletteTileSize) * this.paletteTileSize;
            if (this.btnPalette.x > _loc_2)
            {
                _loc_2 = this.btnPalette.x;
            }
            if (this.btnPalette.y > _loc_3)
            {
                _loc_3 = this.btnPalette.y;
            }
            this.mcColorSelect.x = _loc_2;
            this.mcColorSelect.y = _loc_3;
            return;
        }// end function

        private function onPaletteClick(event:MouseEvent) : void
        {
            this.color = this.palettePendingColor;
            return;
        }// end function

    }
}
