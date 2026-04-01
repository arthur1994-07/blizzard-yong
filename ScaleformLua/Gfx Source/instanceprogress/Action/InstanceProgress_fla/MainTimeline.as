package InstanceProgress_fla
{
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import scaleform.clik.motion.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var text:TextField;
        public var bg:MovieClip;
        public var bgTween:Tween;
        public var bgAlpha:Number;
        public var bgWidth:Number;
        public var textWidth:Number;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function onRollOverBG(event:MouseEvent) : void
        {
            if (this.bgTween != null)
            {
                Tween.removeTween(this.bgTween);
            }
            var _loc_2:* = new Object();
            _loc_2.alpha = 1;
            var _loc_3:* = new Object();
            _loc_3.delay = 0;
            _loc_3.loop = false;
            _loc_3.ease = Strong.easeIn;
            this.bgTween = new Tween(250, this.bg, _loc_2, _loc_3);
            return;
        }// end function

        public function onRollOutBG(event:MouseEvent) : void
        {
            if (this.bgTween != null)
            {
                Tween.removeTween(this.bgTween);
            }
            var _loc_2:* = new Object();
            _loc_2.alpha = this.bgAlpha;
            var _loc_3:* = new Object();
            _loc_3.delay = 0;
            _loc_3.loop = false;
            _loc_3.ease = Strong.easeIn;
            this.bgTween = new Tween(250, this.bg, _loc_2, _loc_3);
            return;
        }// end function

        public function CalcSize(param1:String) : void
        {
            var _loc_2:* = this.text.textWidth + 10;
            var _loc_3:* = _loc_2 + 10;
            if (_loc_3 > this.bgWidth)
            {
                this.text.width = _loc_2;
                this.bg.width = _loc_3;
            }
            else
            {
                this.text.width = this.textWidth;
                this.bg.width = this.bgWidth;
            }
            if (param1 == "1")
            {
                x = (stage.stageWidth - this.bg.width) / 2;
            }
            return;
        }// end function

        function frame1()
        {
            this.bgAlpha = this.bg.alpha;
            this.bgWidth = this.bg.width;
            this.textWidth = this.text.width;
            TextFieldEx.setVerticalAlign(this.text, TextFieldEx.VALIGN_CENTER);
            addEventListener(MouseEvent.ROLL_OVER, this.onRollOverBG, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOutBG, false, 0, true);
            return;
        }// end function

    }
}
