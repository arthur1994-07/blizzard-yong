package Club_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var RanMarking:MovieClip;
        public var Maintain:MovieClip;
        public var Locker:MovieClip;
        public var Info:MovieClip;
        public var btnbarTab:ButtonBar;
        public var DoNotJoinaClub:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_DoNotJoinaClub_Scene1_DoNotJoin_0();
            this.__setProp_btnbarTab_Scene1_category_0();
            return;
        }// end function

        function __setProp_DoNotJoinaClub_Scene1_DoNotJoin_0()
        {
            try
            {
                this.DoNotJoinaClub["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DoNotJoinaClub.autoSize = "center";
            this.DoNotJoinaClub.enabled = true;
            this.DoNotJoinaClub.text = "";
            this.DoNotJoinaClub.visible = true;
            try
            {
                this.DoNotJoinaClub["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnbarTab_Scene1_category_0()
        {
            try
            {
                this.btnbarTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnbarTab.autoSize = "none";
            this.btnbarTab.buttonWidth = 140;
            this.btnbarTab.direction = "horizontal";
            this.btnbarTab.enabled = true;
            this.btnbarTab.focusable = true;
            this.btnbarTab.itemRendererName = "TabButton";
            this.btnbarTab.spacing = 1;
            this.btnbarTab.visible = true;
            try
            {
                this.btnbarTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
