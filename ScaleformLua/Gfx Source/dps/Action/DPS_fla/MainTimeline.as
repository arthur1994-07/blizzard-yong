package DPS_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var DpsLIR_Skill8:DpsLIR_Skill;
        public var DpsLIR1:DpsLIR;
        public var DpsLIR2:DpsLIR;
        public var DpsLIR3:DpsLIR;
        public var DpsLIR_Skill3:DpsLIR_Skill;
        public var DpsLIR4:DpsLIR;
        public var DpsLIR_Skill2:DpsLIR_Skill;
        public var DpsLIR5:DpsLIR;
        public var DpsLIR_Skill1:DpsLIR_Skill;
        public var DpsLIR_Skill7:DpsLIR_Skill;
        public var DpsLIR_Skill6:DpsLIR_Skill;
        public var DpsLIR_Skill5:DpsLIR_Skill;
        public var DpsLIR_Skill4:DpsLIR_Skill;
        public var DpsLIR_Skill9:DpsLIR_Skill;
        public var btnRemove0:Button;
        public var btnRemove1:Button;
        public var btnRemove2:Button;
        public var btnRemove3:Button;
        public var btnRemove4:Button;
        public var listSkill_ScrollBar:ScrollBar;
        public var listChar:ScrollingList;
        public var listSkill:ScrollingList;
        public var label_name1:Label;
        public var label_damage1:Label;
        public var label_time:Label;
        public var label_DPS1:Label;
        public var label_SkillID:Label;
        public var label_name2:Label;
        public var label_damage2:Label;
        public var label_count:Label;
        public var label_DPS2:Label;
        public var label_rate:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listChar_Scene1_list_0();
            this.__setProp_listSkill_Scene1_list_0();
            this.__setProp_label_name1_Scene1_list_0();
            this.__setProp_label_damage1_Scene1_list_0();
            this.__setProp_label_name2_Scene1_list_0();
            this.__setProp_label_damage2_Scene1_list_0();
            this.__setProp_label_time_Scene1_list_0();
            this.__setProp_label_count_Scene1_list_0();
            this.__setProp_label_DPS1_Scene1_list_0();
            this.__setProp_label_DPS2_Scene1_list_0();
            this.__setProp_label_SkillID_Scene1_list_0();
            this.__setProp_label_rate_Scene1_list_0();
            this.__setProp_DpsLIR1_Scene1_renderer_0();
            this.__setProp_DpsLIR2_Scene1_renderer_0();
            this.__setProp_DpsLIR3_Scene1_renderer_0();
            this.__setProp_DpsLIR4_Scene1_renderer_0();
            this.__setProp_DpsLIR5_Scene1_renderer_0();
            this.__setProp_listSkill_ScrollBar_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill1_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill2_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill3_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill4_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill5_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill6_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill7_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill8_Scene1_renderer_0();
            this.__setProp_DpsLIR_Skill9_Scene1_renderer_0();
            this.__setProp_btnRemove0_Scene1_btn_0();
            this.__setProp_btnRemove1_Scene1_btn_0();
            this.__setProp_btnRemove2_Scene1_btn_0();
            this.__setProp_btnRemove3_Scene1_btn_0();
            this.__setProp_btnRemove4_Scene1_btn_0();
            return;
        }// end function

        function __setProp_listChar_Scene1_list_0()
        {
            try
            {
                this.listChar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listChar.enabled = true;
            this.listChar.focusable = true;
            this.listChar.itemRendererName = "";
            this.listChar.itemRendererInstanceName = "DpsLIR";
            this.listChar.margin = 0;
            this.listChar.multiSelect = false;
            this.listChar.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listChar.rowHeight = 0;
            this.listChar.scrollBar = "";
            this.listChar.treeButtonClassName = "";
            this.listChar.treeButtonGap = -1;
            this.listChar.treeCheckBoxClassName = "";
            this.listChar.treeList = false;
            this.listChar.visible = true;
            this.listChar.wrapping = "normal";
            try
            {
                this.listChar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listSkill_Scene1_list_0()
        {
            try
            {
                this.listSkill["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listSkill.enabled = true;
            this.listSkill.focusable = false;
            this.listSkill.itemRendererName = "";
            this.listSkill.itemRendererInstanceName = "DpsLIR_Skill";
            this.listSkill.margin = 0;
            this.listSkill.multiSelect = false;
            this.listSkill.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listSkill.rowHeight = 0;
            this.listSkill.scrollBar = "";
            this.listSkill.treeButtonClassName = "";
            this.listSkill.treeButtonGap = -1;
            this.listSkill.treeCheckBoxClassName = "";
            this.listSkill.treeList = false;
            this.listSkill.visible = true;
            this.listSkill.wrapping = "normal";
            try
            {
                this.listSkill["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_name1_Scene1_list_0()
        {
            try
            {
                this.label_name1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_name1.autoSize = "center";
            this.label_name1.enabled = true;
            this.label_name1.text = "name";
            this.label_name1.visible = true;
            try
            {
                this.label_name1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_damage1_Scene1_list_0()
        {
            try
            {
                this.label_damage1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_damage1.autoSize = "center";
            this.label_damage1.enabled = true;
            this.label_damage1.text = "damage";
            this.label_damage1.visible = true;
            try
            {
                this.label_damage1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_name2_Scene1_list_0()
        {
            try
            {
                this.label_name2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_name2.autoSize = "center";
            this.label_name2.enabled = true;
            this.label_name2.text = "name";
            this.label_name2.visible = true;
            try
            {
                this.label_name2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_damage2_Scene1_list_0()
        {
            try
            {
                this.label_damage2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_damage2.autoSize = "center";
            this.label_damage2.enabled = true;
            this.label_damage2.text = "damage";
            this.label_damage2.visible = true;
            try
            {
                this.label_damage2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_time_Scene1_list_0()
        {
            try
            {
                this.label_time["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_time.autoSize = "center";
            this.label_time.enabled = true;
            this.label_time.text = "time";
            this.label_time.visible = true;
            try
            {
                this.label_time["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_count_Scene1_list_0()
        {
            try
            {
                this.label_count["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_count.autoSize = "center";
            this.label_count.enabled = true;
            this.label_count.text = "count";
            this.label_count.visible = true;
            try
            {
                this.label_count["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_DPS1_Scene1_list_0()
        {
            try
            {
                this.label_DPS1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_DPS1.autoSize = "center";
            this.label_DPS1.enabled = true;
            this.label_DPS1.text = "DPS";
            this.label_DPS1.visible = true;
            try
            {
                this.label_DPS1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_DPS2_Scene1_list_0()
        {
            try
            {
                this.label_DPS2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_DPS2.autoSize = "center";
            this.label_DPS2.enabled = true;
            this.label_DPS2.text = "DPS";
            this.label_DPS2.visible = true;
            try
            {
                this.label_DPS2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_SkillID_Scene1_list_0()
        {
            try
            {
                this.label_SkillID["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_SkillID.autoSize = "center";
            this.label_SkillID.enabled = true;
            this.label_SkillID.text = "SkillID";
            this.label_SkillID.visible = true;
            try
            {
                this.label_SkillID["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_rate_Scene1_list_0()
        {
            try
            {
                this.label_rate["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label_rate.autoSize = "center";
            this.label_rate.enabled = true;
            this.label_rate.text = "rate";
            this.label_rate.visible = true;
            try
            {
                this.label_rate["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR1_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR1.autoRepeat = false;
            this.DpsLIR1.autoSize = "none";
            this.DpsLIR1.enabled = true;
            this.DpsLIR1.groupName = "";
            this.DpsLIR1.label = "";
            this.DpsLIR1.overlayAlign = "none";
            this.DpsLIR1.overlayImg = "";
            this.DpsLIR1.overlayPadding = {x:0, y:0};
            this.DpsLIR1.preventAutoSize = false;
            this.DpsLIR1.selected = false;
            this.DpsLIR1.toggle = false;
            this.DpsLIR1.usePrevLabel = false;
            this.DpsLIR1.visible = true;
            try
            {
                this.DpsLIR1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR2_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR2.autoRepeat = false;
            this.DpsLIR2.autoSize = "none";
            this.DpsLIR2.enabled = true;
            this.DpsLIR2.groupName = "";
            this.DpsLIR2.label = "";
            this.DpsLIR2.overlayAlign = "none";
            this.DpsLIR2.overlayImg = "";
            this.DpsLIR2.overlayPadding = {x:0, y:0};
            this.DpsLIR2.preventAutoSize = false;
            this.DpsLIR2.selected = false;
            this.DpsLIR2.toggle = false;
            this.DpsLIR2.usePrevLabel = false;
            this.DpsLIR2.visible = true;
            try
            {
                this.DpsLIR2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR3_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR3.autoRepeat = false;
            this.DpsLIR3.autoSize = "none";
            this.DpsLIR3.enabled = true;
            this.DpsLIR3.groupName = "";
            this.DpsLIR3.label = "";
            this.DpsLIR3.overlayAlign = "none";
            this.DpsLIR3.overlayImg = "";
            this.DpsLIR3.overlayPadding = {x:0, y:0};
            this.DpsLIR3.preventAutoSize = false;
            this.DpsLIR3.selected = false;
            this.DpsLIR3.toggle = false;
            this.DpsLIR3.usePrevLabel = false;
            this.DpsLIR3.visible = true;
            try
            {
                this.DpsLIR3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR4_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR4.autoRepeat = false;
            this.DpsLIR4.autoSize = "none";
            this.DpsLIR4.enabled = true;
            this.DpsLIR4.groupName = "";
            this.DpsLIR4.label = "";
            this.DpsLIR4.overlayAlign = "none";
            this.DpsLIR4.overlayImg = "";
            this.DpsLIR4.overlayPadding = {x:0, y:0};
            this.DpsLIR4.preventAutoSize = false;
            this.DpsLIR4.selected = false;
            this.DpsLIR4.toggle = false;
            this.DpsLIR4.usePrevLabel = false;
            this.DpsLIR4.visible = true;
            try
            {
                this.DpsLIR4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR5_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR5.autoRepeat = false;
            this.DpsLIR5.autoSize = "none";
            this.DpsLIR5.enabled = true;
            this.DpsLIR5.groupName = "";
            this.DpsLIR5.label = "";
            this.DpsLIR5.overlayAlign = "none";
            this.DpsLIR5.overlayImg = "";
            this.DpsLIR5.overlayPadding = {x:0, y:0};
            this.DpsLIR5.preventAutoSize = false;
            this.DpsLIR5.selected = false;
            this.DpsLIR5.toggle = false;
            this.DpsLIR5.usePrevLabel = false;
            this.DpsLIR5.visible = true;
            try
            {
                this.DpsLIR5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listSkill_ScrollBar_Scene1_renderer_0()
        {
            try
            {
                this.listSkill_ScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listSkill_ScrollBar.enabled = true;
            this.listSkill_ScrollBar.minThumbSize = 10;
            this.listSkill_ScrollBar.offsetBottom = 0;
            this.listSkill_ScrollBar.offsetTop = 0;
            this.listSkill_ScrollBar.scrollTarget = "listSkill";
            this.listSkill_ScrollBar.trackMode = "scrollPage";
            this.listSkill_ScrollBar.visible = true;
            try
            {
                this.listSkill_ScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill1_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill1.autoRepeat = false;
            this.DpsLIR_Skill1.autoSize = "none";
            this.DpsLIR_Skill1.enabled = true;
            this.DpsLIR_Skill1.groupName = "";
            this.DpsLIR_Skill1.label = "";
            this.DpsLIR_Skill1.overlayAlign = "none";
            this.DpsLIR_Skill1.overlayImg = "";
            this.DpsLIR_Skill1.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill1.preventAutoSize = false;
            this.DpsLIR_Skill1.selected = false;
            this.DpsLIR_Skill1.toggle = false;
            this.DpsLIR_Skill1.usePrevLabel = false;
            this.DpsLIR_Skill1.visible = true;
            try
            {
                this.DpsLIR_Skill1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill2_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill2.autoRepeat = false;
            this.DpsLIR_Skill2.autoSize = "none";
            this.DpsLIR_Skill2.enabled = true;
            this.DpsLIR_Skill2.groupName = "";
            this.DpsLIR_Skill2.label = "";
            this.DpsLIR_Skill2.overlayAlign = "none";
            this.DpsLIR_Skill2.overlayImg = "";
            this.DpsLIR_Skill2.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill2.preventAutoSize = false;
            this.DpsLIR_Skill2.selected = false;
            this.DpsLIR_Skill2.toggle = false;
            this.DpsLIR_Skill2.usePrevLabel = false;
            this.DpsLIR_Skill2.visible = true;
            try
            {
                this.DpsLIR_Skill2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill3_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill3.autoRepeat = false;
            this.DpsLIR_Skill3.autoSize = "none";
            this.DpsLIR_Skill3.enabled = true;
            this.DpsLIR_Skill3.groupName = "";
            this.DpsLIR_Skill3.label = "";
            this.DpsLIR_Skill3.overlayAlign = "none";
            this.DpsLIR_Skill3.overlayImg = "";
            this.DpsLIR_Skill3.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill3.preventAutoSize = false;
            this.DpsLIR_Skill3.selected = false;
            this.DpsLIR_Skill3.toggle = false;
            this.DpsLIR_Skill3.usePrevLabel = false;
            this.DpsLIR_Skill3.visible = true;
            try
            {
                this.DpsLIR_Skill3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill4_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill4.autoRepeat = false;
            this.DpsLIR_Skill4.autoSize = "none";
            this.DpsLIR_Skill4.enabled = true;
            this.DpsLIR_Skill4.groupName = "";
            this.DpsLIR_Skill4.label = "";
            this.DpsLIR_Skill4.overlayAlign = "none";
            this.DpsLIR_Skill4.overlayImg = "";
            this.DpsLIR_Skill4.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill4.preventAutoSize = false;
            this.DpsLIR_Skill4.selected = false;
            this.DpsLIR_Skill4.toggle = false;
            this.DpsLIR_Skill4.usePrevLabel = false;
            this.DpsLIR_Skill4.visible = true;
            try
            {
                this.DpsLIR_Skill4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill5_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill5.autoRepeat = false;
            this.DpsLIR_Skill5.autoSize = "none";
            this.DpsLIR_Skill5.enabled = true;
            this.DpsLIR_Skill5.groupName = "";
            this.DpsLIR_Skill5.label = "";
            this.DpsLIR_Skill5.overlayAlign = "none";
            this.DpsLIR_Skill5.overlayImg = "";
            this.DpsLIR_Skill5.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill5.preventAutoSize = false;
            this.DpsLIR_Skill5.selected = false;
            this.DpsLIR_Skill5.toggle = false;
            this.DpsLIR_Skill5.usePrevLabel = false;
            this.DpsLIR_Skill5.visible = true;
            try
            {
                this.DpsLIR_Skill5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill6_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill6.autoRepeat = false;
            this.DpsLIR_Skill6.autoSize = "none";
            this.DpsLIR_Skill6.enabled = true;
            this.DpsLIR_Skill6.groupName = "";
            this.DpsLIR_Skill6.label = "";
            this.DpsLIR_Skill6.overlayAlign = "none";
            this.DpsLIR_Skill6.overlayImg = "";
            this.DpsLIR_Skill6.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill6.preventAutoSize = false;
            this.DpsLIR_Skill6.selected = false;
            this.DpsLIR_Skill6.toggle = false;
            this.DpsLIR_Skill6.usePrevLabel = false;
            this.DpsLIR_Skill6.visible = true;
            try
            {
                this.DpsLIR_Skill6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill7_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill7.autoRepeat = false;
            this.DpsLIR_Skill7.autoSize = "none";
            this.DpsLIR_Skill7.enabled = true;
            this.DpsLIR_Skill7.groupName = "";
            this.DpsLIR_Skill7.label = "";
            this.DpsLIR_Skill7.overlayAlign = "none";
            this.DpsLIR_Skill7.overlayImg = "";
            this.DpsLIR_Skill7.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill7.preventAutoSize = false;
            this.DpsLIR_Skill7.selected = false;
            this.DpsLIR_Skill7.toggle = false;
            this.DpsLIR_Skill7.usePrevLabel = false;
            this.DpsLIR_Skill7.visible = true;
            try
            {
                this.DpsLIR_Skill7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill8_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill8.autoRepeat = false;
            this.DpsLIR_Skill8.autoSize = "none";
            this.DpsLIR_Skill8.enabled = true;
            this.DpsLIR_Skill8.groupName = "";
            this.DpsLIR_Skill8.label = "";
            this.DpsLIR_Skill8.overlayAlign = "none";
            this.DpsLIR_Skill8.overlayImg = "";
            this.DpsLIR_Skill8.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill8.preventAutoSize = false;
            this.DpsLIR_Skill8.selected = false;
            this.DpsLIR_Skill8.toggle = false;
            this.DpsLIR_Skill8.usePrevLabel = false;
            this.DpsLIR_Skill8.visible = true;
            try
            {
                this.DpsLIR_Skill8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DpsLIR_Skill9_Scene1_renderer_0()
        {
            try
            {
                this.DpsLIR_Skill9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DpsLIR_Skill9.autoRepeat = false;
            this.DpsLIR_Skill9.autoSize = "none";
            this.DpsLIR_Skill9.enabled = true;
            this.DpsLIR_Skill9.groupName = "";
            this.DpsLIR_Skill9.label = "";
            this.DpsLIR_Skill9.overlayAlign = "none";
            this.DpsLIR_Skill9.overlayImg = "";
            this.DpsLIR_Skill9.overlayPadding = {x:0, y:0};
            this.DpsLIR_Skill9.preventAutoSize = false;
            this.DpsLIR_Skill9.selected = false;
            this.DpsLIR_Skill9.toggle = false;
            this.DpsLIR_Skill9.usePrevLabel = false;
            this.DpsLIR_Skill9.visible = true;
            try
            {
                this.DpsLIR_Skill9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRemove0_Scene1_btn_0()
        {
            try
            {
                this.btnRemove0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRemove0.autoRepeat = false;
            this.btnRemove0.autoSize = "none";
            this.btnRemove0.enabled = true;
            this.btnRemove0.focusable = false;
            this.btnRemove0.groupName = "";
            this.btnRemove0.label = "";
            this.btnRemove0.overlayAlign = "none";
            this.btnRemove0.overlayImg = "";
            this.btnRemove0.overlayPadding = {x:0, y:0};
            this.btnRemove0.preventAutoSize = true;
            this.btnRemove0.selected = false;
            this.btnRemove0.toggle = false;
            this.btnRemove0.visible = true;
            try
            {
                this.btnRemove0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRemove1_Scene1_btn_0()
        {
            try
            {
                this.btnRemove1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRemove1.autoRepeat = false;
            this.btnRemove1.autoSize = "none";
            this.btnRemove1.enabled = true;
            this.btnRemove1.focusable = false;
            this.btnRemove1.groupName = "";
            this.btnRemove1.label = "";
            this.btnRemove1.overlayAlign = "none";
            this.btnRemove1.overlayImg = "";
            this.btnRemove1.overlayPadding = {x:0, y:0};
            this.btnRemove1.preventAutoSize = true;
            this.btnRemove1.selected = false;
            this.btnRemove1.toggle = false;
            this.btnRemove1.visible = true;
            try
            {
                this.btnRemove1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRemove2_Scene1_btn_0()
        {
            try
            {
                this.btnRemove2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRemove2.autoRepeat = false;
            this.btnRemove2.autoSize = "none";
            this.btnRemove2.enabled = true;
            this.btnRemove2.focusable = false;
            this.btnRemove2.groupName = "";
            this.btnRemove2.label = "";
            this.btnRemove2.overlayAlign = "none";
            this.btnRemove2.overlayImg = "";
            this.btnRemove2.overlayPadding = {x:0, y:0};
            this.btnRemove2.preventAutoSize = true;
            this.btnRemove2.selected = false;
            this.btnRemove2.toggle = false;
            this.btnRemove2.visible = true;
            try
            {
                this.btnRemove2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRemove3_Scene1_btn_0()
        {
            try
            {
                this.btnRemove3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRemove3.autoRepeat = false;
            this.btnRemove3.autoSize = "none";
            this.btnRemove3.enabled = true;
            this.btnRemove3.focusable = false;
            this.btnRemove3.groupName = "";
            this.btnRemove3.label = "";
            this.btnRemove3.overlayAlign = "none";
            this.btnRemove3.overlayImg = "";
            this.btnRemove3.overlayPadding = {x:0, y:0};
            this.btnRemove3.preventAutoSize = true;
            this.btnRemove3.selected = false;
            this.btnRemove3.toggle = false;
            this.btnRemove3.visible = true;
            try
            {
                this.btnRemove3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRemove4_Scene1_btn_0()
        {
            try
            {
                this.btnRemove4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRemove4.autoRepeat = false;
            this.btnRemove4.autoSize = "none";
            this.btnRemove4.enabled = true;
            this.btnRemove4.focusable = false;
            this.btnRemove4.groupName = "";
            this.btnRemove4.label = "";
            this.btnRemove4.overlayAlign = "none";
            this.btnRemove4.overlayImg = "";
            this.btnRemove4.overlayPadding = {x:0, y:0};
            this.btnRemove4.preventAutoSize = true;
            this.btnRemove4.selected = false;
            this.btnRemove4.toggle = false;
            this.btnRemove4.visible = true;
            try
            {
                this.btnRemove4["componentInspectorSetting"] = false;
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
