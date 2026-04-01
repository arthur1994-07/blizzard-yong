package Skill_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item5:MovieClip;
        public var item6:MovieClip;
        public var item7:MovieClip;
        public var item10:MovieClip;
        public var item8:MovieClip;
        public var exList:SkillTileList;
        public var item11:MovieClip;
        public var item9:MovieClip;
        public var item12:MovieClip;
        public var item13:MovieClip;
        public var item14:MovieClip;
        public var item15:MovieClip;
        public var item16:MovieClip;
        public var item17:MovieClip;
        public var item18:MovieClip;
        public var item1:MovieClip;
        public var item2:MovieClip;
        public var item3:MovieClip;
        public var item4:MovieClip;
        public var tabPage:ButtonBar;
        public var btnReset:Button;
        public var btnApply:Button;
        public var btnCharInfoSwap:Button;
        public var labelSkillPoint:Label;
        public var HelpBtn:Button;
        public var btnStat_SkillReset:Button;
        public var btnRecommend_Skil:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnReset_Scene1_slot_button_0();
            this.__setProp_btnApply_Scene1_slot_button_0();
            this.__setProp_labelSkillPoint_Scene1_slot_button_0();
            this.__setProp_btnCharInfoSwap_Scene1_slot_button_0();
            this.__setProp_btnStat_SkillReset_Scene1_slot_button_0();
            this.__setProp_btnRecommend_Skil_Scene1_slot_button_0();
            this.__setProp_tabPage_Scene1_tab_0();
            return;
        }// end function

        function __setProp_btnReset_Scene1_slot_button_0()
        {
            try
            {
                this.btnReset["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReset.autoRepeat = false;
            this.btnReset.autoSize = "none";
            this.btnReset.enabled = true;
            this.btnReset.focusable = false;
            this.btnReset.groupName = "";
            this.btnReset.label = "";
            this.btnReset.overlayAlign = "none";
            this.btnReset.overlayImg = "";
            this.btnReset.overlayPadding = {x:0, y:0};
            this.btnReset.selected = false;
            this.btnReset.toggle = false;
            this.btnReset.visible = true;
            try
            {
                this.btnReset["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnApply_Scene1_slot_button_0()
        {
            try
            {
                this.btnApply["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnApply.autoRepeat = false;
            this.btnApply.autoSize = "none";
            this.btnApply.enabled = true;
            this.btnApply.focusable = false;
            this.btnApply.groupName = "";
            this.btnApply.label = "";
            this.btnApply.overlayAlign = "none";
            this.btnApply.overlayImg = "";
            this.btnApply.overlayPadding = {x:0, y:0};
            this.btnApply.selected = false;
            this.btnApply.toggle = false;
            this.btnApply.visible = true;
            try
            {
                this.btnApply["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelSkillPoint_Scene1_slot_button_0()
        {
            try
            {
                this.labelSkillPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelSkillPoint.autoSize = "center";
            this.labelSkillPoint.enabled = true;
            this.labelSkillPoint.text = "";
            this.labelSkillPoint.visible = true;
            try
            {
                this.labelSkillPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfoSwap_Scene1_slot_button_0()
        {
            try
            {
                this.btnCharInfoSwap["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfoSwap.autoRepeat = false;
            this.btnCharInfoSwap.autoSize = "none";
            this.btnCharInfoSwap.enabled = true;
            this.btnCharInfoSwap.focusable = false;
            this.btnCharInfoSwap.groupName = "";
            this.btnCharInfoSwap.label = "";
            this.btnCharInfoSwap.overlayAlign = "none";
            this.btnCharInfoSwap.overlayImg = "";
            this.btnCharInfoSwap.overlayPadding = {x:0, y:0};
            this.btnCharInfoSwap.selected = false;
            this.btnCharInfoSwap.toggle = false;
            this.btnCharInfoSwap.visible = true;
            try
            {
                this.btnCharInfoSwap["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat_SkillReset_Scene1_slot_button_0()
        {
            try
            {
                this.btnStat_SkillReset["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat_SkillReset.autoRepeat = false;
            this.btnStat_SkillReset.autoSize = "none";
            this.btnStat_SkillReset.enabled = true;
            this.btnStat_SkillReset.focusable = false;
            this.btnStat_SkillReset.groupName = "";
            this.btnStat_SkillReset.label = "";
            this.btnStat_SkillReset.overlayAlign = "none";
            this.btnStat_SkillReset.overlayImg = "";
            this.btnStat_SkillReset.overlayPadding = {x:0, y:0};
            this.btnStat_SkillReset.selected = false;
            this.btnStat_SkillReset.toggle = false;
            this.btnStat_SkillReset.visible = true;
            try
            {
                this.btnStat_SkillReset["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRecommend_Skil_Scene1_slot_button_0()
        {
            try
            {
                this.btnRecommend_Skil["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRecommend_Skil.autoRepeat = false;
            this.btnRecommend_Skil.autoSize = "none";
            this.btnRecommend_Skil.enabled = true;
            this.btnRecommend_Skil.focusable = false;
            this.btnRecommend_Skil.groupName = "";
            this.btnRecommend_Skil.label = "";
            this.btnRecommend_Skil.overlayAlign = "none";
            this.btnRecommend_Skil.overlayImg = "";
            this.btnRecommend_Skil.overlayPadding = {x:0, y:0};
            this.btnRecommend_Skil.selected = false;
            this.btnRecommend_Skil.toggle = false;
            this.btnRecommend_Skil.visible = false;
            try
            {
                this.btnRecommend_Skil["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tabPage_Scene1_tab_0()
        {
            try
            {
                this.tabPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabPage.autoSize = "none";
            this.tabPage.buttonWidth = 90;
            this.tabPage.direction = "horizontal";
            this.tabPage.enabled = true;
            this.tabPage.focusable = true;
            this.tabPage.itemRendererName = "TabButton";
            this.tabPage.spacing = 2;
            this.tabPage.visible = true;
            try
            {
                this.tabPage["componentInspectorSetting"] = false;
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
