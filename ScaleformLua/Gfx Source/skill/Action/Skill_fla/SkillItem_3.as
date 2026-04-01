package Skill_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class SkillItem_3 extends MovieClip
    {
        public var Block:MovieClip;
        public var mcNextLevelOver:over;
        public var btnUp:Button;
        public var btnDown:Button;
        public var slot:Slot;

        public function SkillItem_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnUp_SkillItem_asset_0();
            this.__setProp_btnDown_SkillItem_asset_0();
            return;
        }// end function

        function __setProp_btnUp_SkillItem_asset_0()
        {
            try
            {
                this.btnUp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUp.autoRepeat = true;
            this.btnUp.autoSize = "none";
            this.btnUp.enabled = true;
            this.btnUp.focusable = false;
            this.btnUp.groupName = "";
            this.btnUp.label = "+";
            this.btnUp.overlayAlign = "none";
            this.btnUp.overlayImg = "";
            this.btnUp.overlayPadding = {x:0, y:0};
            this.btnUp.selected = false;
            this.btnUp.toggle = false;
            this.btnUp.visible = true;
            try
            {
                this.btnUp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDown_SkillItem_asset_0()
        {
            try
            {
                this.btnDown["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDown.autoRepeat = true;
            this.btnDown.autoSize = "none";
            this.btnDown.enabled = true;
            this.btnDown.focusable = false;
            this.btnDown.groupName = "";
            this.btnDown.label = "-";
            this.btnDown.overlayAlign = "none";
            this.btnDown.overlayImg = "";
            this.btnDown.overlayPadding = {x:0, y:0};
            this.btnDown.selected = false;
            this.btnDown.toggle = false;
            this.btnDown.visible = true;
            try
            {
                this.btnDown["componentInspectorSetting"] = false;
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
