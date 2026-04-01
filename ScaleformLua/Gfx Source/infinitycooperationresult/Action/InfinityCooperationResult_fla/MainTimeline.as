package InfinityCooperationResult_fla
{
    import flash.display.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var TextDamage:DefaultLabel;
        public var ButtonExit:DefaultButton;
        public var TextTime:TimeLabel;
        public var Row0:MovieClip;
        public var Row1:MovieClip;
        public var Row2:MovieClip;
        public var Row3:MovieClip;
        public var Row4:MovieClip;
        public var TextHeal:DefaultLabel;
        public var Row5:MovieClip;
        public var TextTitle:MediumLabel;
        public var TextBonus:DefaultLabel;
        public var Row6:MovieClip;
        public var Row7:MovieClip;
        public var TextClass:DefaultLabel;
        public var TextChaName:DefaultLabel;

        public function MainTimeline()
        {
            this.__setProp_ButtonExit_Scene1_();
            return;
        }// end function

        function __setProp_ButtonExit_Scene1_()
        {
            try
            {
                this.ButtonExit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ButtonExit.autoRepeat = false;
            this.ButtonExit.autoSize = "none";
            this.ButtonExit.enabled = true;
            this.ButtonExit.everyFrameUpdate = true;
            this.ButtonExit.focusable = false;
            this.ButtonExit.label = "DefautlButton";
            this.ButtonExit.preventAutoSize = true;
            this.ButtonExit.selected = false;
            this.ButtonExit.toggle = false;
            this.ButtonExit.visible = true;
            try
            {
                this.ButtonExit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
