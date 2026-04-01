package GuidanceBattleTime_fla
{
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.motion.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var bg:MovieClip;
        public var bgTween:Tween;
        public var labelTitle:Label;
        public var labelLeftTime:Label;
        public const LineStartY:int = 50;
        public const ItemHeight:int = 22;
        public var mapItem:Dictionary;
        public var LineCount:int;
        public var bgAlpha:Number;
        public var bgWidth:Number;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_Scene1_asset_0();
            this.__setProp_labelLeftTime_Scene1_asset_0();
            return;
        }// end function

        public function onRollOverBG(event:MouseEvent) : void
        {
            if (this.bgTween != null)
            {
                Tween.removeTween(this.bgTween);
            }
            var _loc_2:* = new Object();
            _loc_2.alpha = 0.5;
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

        public function onEnter(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnter);
            this.mapItem = new Dictionary();
            return;
        }// end function

        public function SetTitle(param1:String, param2:String) : void
        {
            this.labelTitle.text = param1;
            this.labelTitle.validateNow();
            this.labelLeftTime.text = param2;
            this.labelLeftTime.validateNow();
            var _loc_3:* = this.labelTitle.textField.getTextFormat();
            _loc_3.color = 16711680;
            this.labelTitle.textField.setTextFormat(_loc_3);
            _loc_3 = this.labelLeftTime.textField.getTextFormat();
            _loc_3.color = 16711680;
            this.labelLeftTime.textField.setTextFormat(_loc_3);
            return;
        }// end function

        public function AddLine(param1:int, param2:String) : void
        {
            if (this.mapItem[param1] != null)
            {
                return;
            }
            var _loc_3:* = new LeftTimeItem();
            _loc_3.x = 0;
            _loc_3.y = this.LineStartY + this.ItemHeight * this.LineCount;
            _loc_3.labelName.text = param2;
            _loc_3.labelName.validateNow();
            addChild(_loc_3);
            this.mapItem[param1] = _loc_3;
            var _loc_4:* = _loc_3.labelName.textField.getTextFormat();
            _loc_4.color = 16711680;
            _loc_3.labelName.textField.setTextFormat(_loc_4);
            var _loc_5:* = this;
            var _loc_6:* = this.LineCount + 1;
            _loc_5.LineCount = _loc_6;
            this.bg.height = this.LineStartY + this.ItemHeight * this.LineCount;
            return;
        }// end function

        public function SetLeftTime(param1:int, param2:String) : void
        {
            var _loc_3:* = this.mapItem[param1];
            if (_loc_3 == null)
            {
                return;
            }
            _loc_3.labelLeftTime.text = param2;
            _loc_3.labelLeftTime.validateNow();
            var _loc_4:* = _loc_3.labelLeftTime.textField.getTextFormat();
            _loc_4.color = 16711680;
            _loc_3.labelLeftTime.textField.setTextFormat(_loc_4);
            return;
        }// end function

        public function Clear() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            for (_loc_1 in this.mapItem)
            {
                
                _loc_2 = _loc_4[_loc_1];
                removeChild(_loc_2);
                _loc_4[_loc_1] = null;
            }
            this.LineCount = 0;
            return;
        }// end function

        function __setProp_labelTitle_Scene1_asset_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "center";
            this.labelTitle.autoSizeEnable = false;
            this.labelTitle.enabled = true;
            this.labelTitle.text = "Title";
            this.labelTitle.visible = true;
            try
            {
                this.labelTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelLeftTime_Scene1_asset_0()
        {
            try
            {
                this.labelLeftTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelLeftTime.autoSize = "center";
            this.labelLeftTime.autoSizeEnable = false;
            this.labelLeftTime.enabled = true;
            this.labelLeftTime.text = "LeftTime";
            this.labelLeftTime.visible = true;
            try
            {
                this.labelLeftTime["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.LineCount = 0;
            this.bgAlpha = this.bg.alpha;
            this.bgWidth = this.bg.width;
            addEventListener(MouseEvent.ROLL_OVER, this.onRollOverBG, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOutBG, false, 0, true);
            addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            return;
        }// end function

    }
}
