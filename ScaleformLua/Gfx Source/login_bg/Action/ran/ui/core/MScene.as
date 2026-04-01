package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class MScene extends MovieClip
    {
        public var Scaleform_logo:MovieClip;
        protected var customOption:Dictionary;
        protected var isInit:Boolean = false;
        public var stageInstance:Stage = null;
        static const OrigScreenW:int = 1024;
        static const OrigScreenH:int = 720;
        static const imgSizeW:int = 1024;
        static const imgSizeH:int = 512;
        static const AlignNone:uint = 0;
        static const AlignL:uint = 1;
        static const AlignH:uint = 2;
        static const AlignR:uint = 4;
        static const AlignT:uint = 8;
        static const AlignV:uint = 16;
        static const AlignB:uint = 32;
        static const SizeNone:uint = 0;
        static const SizeW:uint = 1;
        static const SizeH:uint = 2;
        static const ScaleNone:uint = 0;
        static const ScaleX:uint = 1;
        static const ScaleY:uint = 2;

        public function MScene()
        {
            addFrameScript(0, this.frame1);
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.addEventListener(Event.RESIZE, this.onResolution, false, 0, true);
            addEventListener(Event.ENTER_FRAME, this.onInit, false, 0, true);
            this.customOption = new Dictionary();
            return;
        }// end function

        protected function onResolution(event:Event) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            if (this.isInit == false)
            {
                return;
            }
            var _loc_2:* = stage.stageWidth / OrigScreenW;
            var _loc_3:* = stage.stageHeight / OrigScreenH;
            for (_loc_4 in this.customOption)
            {
                
                _loc_5 = _loc_9[_loc_4];
                if (_loc_5.scale & ScaleX)
                {
                    _loc_4.scaleX = _loc_5.sx * _loc_2;
                }
                if (_loc_5.scale & ScaleY)
                {
                    _loc_4.scaleY = _loc_5.sy * _loc_3;
                }
                if (_loc_5.size & SizeW)
                {
                    _loc_4.width = _loc_5.w * _loc_2;
                }
                if (_loc_5.size & SizeH)
                {
                    _loc_4.height = _loc_5.h * _loc_3;
                }
                _loc_6 = _loc_4.scaleX * _loc_4.width;
                _loc_7 = _loc_4.scaleY * _loc_4.height;
                if (_loc_5.align & AlignL)
                {
                    _loc_4.x = _loc_5.x * _loc_2;
                }
                if (_loc_5.align & AlignT)
                {
                    _loc_4.y = _loc_5.y * _loc_3;
                }
                if (_loc_5.align & AlignR)
                {
                    _loc_4.x = stage.stageWidth - (OrigScreenW - (_loc_5.x + _loc_5.w)) * _loc_2 - _loc_4.width;
                }
                if (_loc_5.align & AlignB)
                {
                    _loc_4.y = stage.stageHeight - (OrigScreenH - (_loc_5.y + _loc_5.h)) * _loc_3 - _loc_4.height;
                }
                if (_loc_5.align & AlignH)
                {
                    _loc_4.x = (stage.stageWidth - _loc_6) / 2;
                }
                if (_loc_5.align & AlignV)
                {
                    _loc_4.y = (stage.stageHeight - _loc_7) / 2;
                }
                _loc_4.x = Math.round(_loc_4.x);
                _loc_4.y = Math.round(_loc_4.y);
            }
            return;
        }// end function

        protected function onInit(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onInit);
            this.isInit = true;
            this.onResolution(null);
            return;
        }// end function

        protected function addCustomOption(param1:DisplayObject, param2:uint, param3:uint, param4:uint) : void
        {
            var _loc_5:* = new Object();
            _loc_5.x = param1.x;
            _loc_5.y = param1.y;
            _loc_5.w = param1.width;
            _loc_5.h = param1.height;
            _loc_5.sx = param1.scaleX;
            _loc_5.sy = param1.scaleY;
            _loc_5.align = param2;
            _loc_5.size = param3;
            _loc_5.scale = param4;
            this.customOption[param1] = _loc_5;
            return;
        }// end function

        function frame1()
        {
            this.addCustomOption(this.Scaleform_logo, AlignR | AlignB, SizeNone, ScaleNone);
            return;
        }// end function

    }
}
