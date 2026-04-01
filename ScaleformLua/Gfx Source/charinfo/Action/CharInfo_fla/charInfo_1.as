package CharInfo_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class charInfo_1 extends MovieClip
    {
        public var Detail9:DetailComponent;
        public var Stat4:StatComponent;
        public var Stat5:StatComponent;
        public var StatCompare1:MovieClip;
        public var StatCompare2:MovieClip;
        public var skill_type_e:ToggleButton_skill_type;
        public var StatCompare3:MovieClip;
        public var skill_type_d:ToggleButton_skill_type;
        public var StatCompare4:MovieClip;
        public var StatCompare5:MovieClip;
        public var Detail10:DetailComponent;
        public var skill_type_a:ToggleButton_skill_type;
        public var weaponSlot:MovieClip;
        public var Detail11:DetailComponent;
        public var Detail1:DetailComponent;
        public var skill_type_c:ToggleButton_skill_type;
        public var Detail2:DetailComponent;
        public var skill_type_b:ToggleButton_skill_type;
        public var Detail3:DetailComponent;
        public var mcGender:gender_img;
        public var Detail4:DetailComponent;
        public var Detail5:DetailComponent;
        public var Stat1:StatComponent;
        public var Detail6:DetailComponent;
        public var Detail7:DetailComponent;
        public var Stat2:StatComponent;
        public var Detail8:DetailComponent;
        public var Stat3:StatComponent;
        public var labelLevelName:Label;
        public var labelClub:Label;
        public var labelAddOn:Label;
        public var labelChStatTitle:Label;
        public var labelChStatValue:Label;
        public var tfPoint:Label;
        public var tfPointVal:Label;
        public var tfSchoolClass:Label;
        public var tfAtb:Label;
        public var tfAtbPoint:Label;
        public var tfLiving:Label;
        public var tfLivingPoint:Label;
        public var tfCsb:Label;
        public var tfCsbScore:Label;
        public var tfConfilc:Label;
        public var tfConfilcScore:Label;
        public var comboBadge:DropdownMenu;
        public var btnAddOn:Button;
        public var btnHelp2:Button;
        public var btnHelp1:Button;
        public var btnStat1Up:Button;
        public var btnStat2Up:Button;
        public var btnStat3Up:Button;
        public var btnStat4Up:Button;
        public var btnStat5Up:Button;
        public var btnStat1Down:Button;
        public var btnStat2Down:Button;
        public var btnStat3Down:Button;
        public var btnStat4Down:Button;
        public var btnStat5Down:Button;
        public var btnInit:Button;
        public var btnApply:Button;
        public var btnSkill:Button;
        public var slot0:Slot;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var slot6:Slot;
        public var slot7:Slot;
        public var slot8:Slot;
        public var slot9:Slot;
        public var slot10:Slot;
        public var slot11:Slot;
        public var slot12:Slot;
        public var slot13:Slot;
        public var slot14:Slot;
        public var mcCountryImg:UIComponent;

        public function charInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tfAtb_charInfo_Text_0();
            this.__setProp_tfAtbPoint_charInfo_Text_0();
            this.__setProp_tfLiving_charInfo_Text_0();
            this.__setProp_tfLivingPoint_charInfo_Text_0();
            this.__setProp_tfCsb_charInfo_Text_0();
            this.__setProp_tfCsbScore_charInfo_Text_0();
            this.__setProp_labelChStatTitle_charInfo_Text_0();
            this.__setProp_labelChStatValue_charInfo_Text_0();
            this.__setProp_tfConfilc_charInfo_Text_0();
            this.__setProp_tfConfilcScore_charInfo_Text_0();
            this.__setProp_btnSkill_charInfo_button_0();
            this.__setProp_slot0_charInfo_button_0();
            this.__setProp_slot1_charInfo_button_0();
            this.__setProp_slot2_charInfo_button_0();
            this.__setProp_slot3_charInfo_button_0();
            this.__setProp_slot4_charInfo_button_0();
            this.__setProp_slot5_charInfo_button_0();
            this.__setProp_slot6_charInfo_button_0();
            this.__setProp_slot7_charInfo_button_0();
            this.__setProp_slot8_charInfo_button_0();
            this.__setProp_slot9_charInfo_button_0();
            this.__setProp_slot10_charInfo_button_0();
            this.__setProp_slot12_charInfo_button_0();
            this.__setProp_slot13_charInfo_button_0();
            this.__setProp_slot14_charInfo_button_0();
            this.__setProp_btnInit_charInfo_button_0();
            this.__setProp_btnApply_charInfo_button_0();
            this.__setProp_btnHelp2_charInfo_button_0();
            this.__setProp_btnHelp1_charInfo_button_0();
            this.__setProp_btnStat1Up_charInfo_button_0();
            this.__setProp_btnStat1Down_charInfo_button_0();
            this.__setProp_btnStat2Up_charInfo_button_0();
            this.__setProp_btnStat2Down_charInfo_button_0();
            this.__setProp_btnStat3Up_charInfo_button_0();
            this.__setProp_btnStat3Down_charInfo_button_0();
            this.__setProp_btnStat4Up_charInfo_button_0();
            this.__setProp_btnStat4Down_charInfo_button_0();
            this.__setProp_btnStat5Up_charInfo_button_0();
            this.__setProp_btnStat5Down_charInfo_button_0();
            this.__setProp_slot11_charInfo_button_0();
            this.__setProp_labelAddOn_charInfo_button_0();
            this.__setProp_btnAddOn_charInfo_button_0();
            this.__setProp_tfPoint_charInfo_button_0();
            this.__setProp_tfPointVal_charInfo_button_0();
            this.__setProp_tfSchoolClass_charInfo_button_0();
            this.__setProp_skill_type_a_charInfo_button_0();
            this.__setProp_skill_type_b_charInfo_button_0();
            this.__setProp_skill_type_c_charInfo_button_0();
            this.__setProp_skill_type_d_charInfo_button_0();
            this.__setProp_skill_type_e_charInfo_button_0();
            return;
        }// end function

        function __setProp_tfAtb_charInfo_Text_0()
        {
            try
            {
                this.tfAtb["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfAtb.autoSize = "right";
            this.tfAtb.autoSizeEnable = false;
            this.tfAtb.enabled = true;
            this.tfAtb.text = "Attr.";
            this.tfAtb.visible = true;
            try
            {
                this.tfAtb["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfAtbPoint_charInfo_Text_0()
        {
            try
            {
                this.tfAtbPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfAtbPoint.autoSize = "left";
            this.tfAtbPoint.autoSizeEnable = false;
            this.tfAtbPoint.enabled = true;
            this.tfAtbPoint.text = "99999";
            this.tfAtbPoint.visible = true;
            try
            {
                this.tfAtbPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfLiving_charInfo_Text_0()
        {
            try
            {
                this.tfLiving["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfLiving.autoSize = "right";
            this.tfLiving.autoSizeEnable = false;
            this.tfLiving.enabled = true;
            this.tfLiving.text = "Life Point";
            this.tfLiving.visible = true;
            try
            {
                this.tfLiving["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfLivingPoint_charInfo_Text_0()
        {
            try
            {
                this.tfLivingPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfLivingPoint.autoSize = "left";
            this.tfLivingPoint.autoSizeEnable = false;
            this.tfLivingPoint.enabled = true;
            this.tfLivingPoint.text = "99999";
            this.tfLivingPoint.visible = true;
            try
            {
                this.tfLivingPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfCsb_charInfo_Text_0()
        {
            try
            {
                this.tfCsb["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfCsb.autoSize = "right";
            this.tfCsb.autoSizeEnable = false;
            this.tfCsb.enabled = true;
            this.tfCsb.text = "Contribution";
            this.tfCsb.visible = true;
            try
            {
                this.tfCsb["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfCsbScore_charInfo_Text_0()
        {
            try
            {
                this.tfCsbScore["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfCsbScore.autoSize = "left";
            this.tfCsbScore.autoSizeEnable = false;
            this.tfCsbScore.enabled = true;
            this.tfCsbScore.text = "99999";
            this.tfCsbScore.visible = true;
            try
            {
                this.tfCsbScore["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelChStatTitle_charInfo_Text_0()
        {
            try
            {
                this.labelChStatTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelChStatTitle.autoSize = "center";
            this.labelChStatTitle.autoSizeEnable = false;
            this.labelChStatTitle.enabled = true;
            this.labelChStatTitle.text = "";
            this.labelChStatTitle.visible = true;
            try
            {
                this.labelChStatTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelChStatValue_charInfo_Text_0()
        {
            try
            {
                this.labelChStatValue["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelChStatValue.autoSize = "center";
            this.labelChStatValue.autoSizeEnable = false;
            this.labelChStatValue.enabled = true;
            this.labelChStatValue.text = "";
            this.labelChStatValue.visible = true;
            try
            {
                this.labelChStatValue["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfConfilc_charInfo_Text_0()
        {
            try
            {
                this.tfConfilc["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfConfilc.autoSize = "right";
            this.tfConfilc.autoSizeEnable = false;
            this.tfConfilc.enabled = true;
            this.tfConfilc.text = "Contribution";
            this.tfConfilc.visible = true;
            try
            {
                this.tfConfilc["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfConfilcScore_charInfo_Text_0()
        {
            try
            {
                this.tfConfilcScore["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfConfilcScore.autoSize = "left";
            this.tfConfilcScore.autoSizeEnable = false;
            this.tfConfilcScore.enabled = true;
            this.tfConfilcScore.text = "99999";
            this.tfConfilcScore.visible = true;
            try
            {
                this.tfConfilcScore["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSkill_charInfo_button_0()
        {
            try
            {
                this.btnSkill["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSkill.autoRepeat = false;
            this.btnSkill.autoSize = "none";
            this.btnSkill.enabled = true;
            this.btnSkill.focusable = false;
            this.btnSkill.groupName = "";
            this.btnSkill.label = "";
            this.btnSkill.overlayAlign = "none";
            this.btnSkill.overlayImg = "";
            this.btnSkill.overlayPadding = {x:0, y:0};
            this.btnSkill.selected = false;
            this.btnSkill.toggle = false;
            this.btnSkill.visible = true;
            try
            {
                this.btnSkill["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot0_charInfo_button_0()
        {
            try
            {
                this.slot0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot0.overlayImg = "hat_symbol";
            this.slot0.visible = true;
            try
            {
                this.slot0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot1_charInfo_button_0()
        {
            try
            {
                this.slot1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot1.overlayImg = "coat_symbol";
            this.slot1.visible = true;
            try
            {
                this.slot1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot2_charInfo_button_0()
        {
            try
            {
                this.slot2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot2.overlayImg = "belt_symbol";
            this.slot2.visible = true;
            try
            {
                this.slot2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot3_charInfo_button_0()
        {
            try
            {
                this.slot3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot3.overlayImg = "pants_symbol";
            this.slot3.visible = true;
            try
            {
                this.slot3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot4_charInfo_button_0()
        {
            try
            {
                this.slot4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot4.overlayImg = "gloves_symbol";
            this.slot4.visible = true;
            try
            {
                this.slot4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot5_charInfo_button_0()
        {
            try
            {
                this.slot5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot5.overlayImg = "shoes_symbol";
            this.slot5.visible = true;
            try
            {
                this.slot5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot6_charInfo_button_0()
        {
            try
            {
                this.slot6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot6.overlayImg = "earring_symbol";
            this.slot6.visible = true;
            try
            {
                this.slot6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot7_charInfo_button_0()
        {
            try
            {
                this.slot7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot7.overlayImg = "etc_symbol";
            this.slot7.visible = true;
            try
            {
                this.slot7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot8_charInfo_button_0()
        {
            try
            {
                this.slot8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot8.overlayImg = "necklace_symbol";
            this.slot8.visible = true;
            try
            {
                this.slot8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot9_charInfo_button_0()
        {
            try
            {
                this.slot9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot9.overlayImg = "bracelet_symbol";
            this.slot9.visible = true;
            try
            {
                this.slot9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot10_charInfo_button_0()
        {
            try
            {
                this.slot10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot10.overlayImg = "ring_symbol";
            this.slot10.visible = true;
            try
            {
                this.slot10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot12_charInfo_button_0()
        {
            try
            {
                this.slot12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot12.overlayImg = "card_symbol";
            this.slot12.visible = true;
            try
            {
                this.slot12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot13_charInfo_button_0()
        {
            try
            {
                this.slot13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot13.overlayImg = "card_symbol";
            this.slot13.visible = true;
            try
            {
                this.slot13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot14_charInfo_button_0()
        {
            try
            {
                this.slot14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot14.overlayImg = "vehicle_symbol";
            this.slot14.visible = true;
            try
            {
                this.slot14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnInit_charInfo_button_0()
        {
            try
            {
                this.btnInit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnInit.autoRepeat = false;
            this.btnInit.autoSize = "none";
            this.btnInit.enabled = true;
            this.btnInit.focusable = false;
            this.btnInit.groupName = "";
            this.btnInit.label = "";
            this.btnInit.overlayAlign = "none";
            this.btnInit.overlayImg = "";
            this.btnInit.overlayPadding = {x:0, y:0};
            this.btnInit.selected = false;
            this.btnInit.toggle = false;
            this.btnInit.visible = true;
            try
            {
                this.btnInit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnApply_charInfo_button_0()
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

        function __setProp_btnHelp2_charInfo_button_0()
        {
            try
            {
                this.btnHelp2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp2.autoRepeat = false;
            this.btnHelp2.autoSize = "none";
            this.btnHelp2.enabled = true;
            this.btnHelp2.focusable = false;
            this.btnHelp2.groupName = "";
            this.btnHelp2.label = "?";
            this.btnHelp2.overlayAlign = "none";
            this.btnHelp2.overlayImg = "";
            this.btnHelp2.overlayPadding = {x:0, y:0};
            this.btnHelp2.selected = false;
            this.btnHelp2.toggle = false;
            this.btnHelp2.visible = true;
            try
            {
                this.btnHelp2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp1_charInfo_button_0()
        {
            try
            {
                this.btnHelp1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp1.autoRepeat = false;
            this.btnHelp1.autoSize = "none";
            this.btnHelp1.enabled = true;
            this.btnHelp1.focusable = false;
            this.btnHelp1.groupName = "";
            this.btnHelp1.label = "?";
            this.btnHelp1.overlayAlign = "none";
            this.btnHelp1.overlayImg = "";
            this.btnHelp1.overlayPadding = {x:0, y:0};
            this.btnHelp1.selected = false;
            this.btnHelp1.toggle = false;
            this.btnHelp1.visible = true;
            try
            {
                this.btnHelp1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat1Up_charInfo_button_0()
        {
            try
            {
                this.btnStat1Up["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat1Up.autoRepeat = true;
            this.btnStat1Up.autoSize = "none";
            this.btnStat1Up.enabled = true;
            this.btnStat1Up.focusable = false;
            this.btnStat1Up.groupName = "";
            this.btnStat1Up.label = "";
            this.btnStat1Up.overlayAlign = "none";
            this.btnStat1Up.overlayImg = "";
            this.btnStat1Up.overlayPadding = {x:0, y:0};
            this.btnStat1Up.selected = false;
            this.btnStat1Up.toggle = false;
            this.btnStat1Up.visible = true;
            try
            {
                this.btnStat1Up["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat1Down_charInfo_button_0()
        {
            try
            {
                this.btnStat1Down["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat1Down.autoRepeat = true;
            this.btnStat1Down.autoSize = "none";
            this.btnStat1Down.enabled = true;
            this.btnStat1Down.focusable = false;
            this.btnStat1Down.groupName = "";
            this.btnStat1Down.label = "";
            this.btnStat1Down.overlayAlign = "none";
            this.btnStat1Down.overlayImg = "";
            this.btnStat1Down.overlayPadding = {x:0, y:0};
            this.btnStat1Down.selected = false;
            this.btnStat1Down.toggle = false;
            this.btnStat1Down.visible = true;
            try
            {
                this.btnStat1Down["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat2Up_charInfo_button_0()
        {
            try
            {
                this.btnStat2Up["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat2Up.autoRepeat = true;
            this.btnStat2Up.autoSize = "none";
            this.btnStat2Up.enabled = true;
            this.btnStat2Up.focusable = false;
            this.btnStat2Up.groupName = "";
            this.btnStat2Up.label = "";
            this.btnStat2Up.overlayAlign = "none";
            this.btnStat2Up.overlayImg = "";
            this.btnStat2Up.overlayPadding = {x:0, y:0};
            this.btnStat2Up.selected = false;
            this.btnStat2Up.toggle = false;
            this.btnStat2Up.visible = true;
            try
            {
                this.btnStat2Up["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat2Down_charInfo_button_0()
        {
            try
            {
                this.btnStat2Down["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat2Down.autoRepeat = true;
            this.btnStat2Down.autoSize = "none";
            this.btnStat2Down.enabled = true;
            this.btnStat2Down.focusable = false;
            this.btnStat2Down.groupName = "";
            this.btnStat2Down.label = "";
            this.btnStat2Down.overlayAlign = "none";
            this.btnStat2Down.overlayImg = "";
            this.btnStat2Down.overlayPadding = {x:0, y:0};
            this.btnStat2Down.selected = false;
            this.btnStat2Down.toggle = false;
            this.btnStat2Down.visible = true;
            try
            {
                this.btnStat2Down["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat3Up_charInfo_button_0()
        {
            try
            {
                this.btnStat3Up["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat3Up.autoRepeat = true;
            this.btnStat3Up.autoSize = "none";
            this.btnStat3Up.enabled = true;
            this.btnStat3Up.focusable = false;
            this.btnStat3Up.groupName = "";
            this.btnStat3Up.label = "";
            this.btnStat3Up.overlayAlign = "none";
            this.btnStat3Up.overlayImg = "";
            this.btnStat3Up.overlayPadding = {x:0, y:0};
            this.btnStat3Up.selected = false;
            this.btnStat3Up.toggle = false;
            this.btnStat3Up.visible = true;
            try
            {
                this.btnStat3Up["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat3Down_charInfo_button_0()
        {
            try
            {
                this.btnStat3Down["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat3Down.autoRepeat = true;
            this.btnStat3Down.autoSize = "none";
            this.btnStat3Down.enabled = true;
            this.btnStat3Down.focusable = false;
            this.btnStat3Down.groupName = "";
            this.btnStat3Down.label = "";
            this.btnStat3Down.overlayAlign = "none";
            this.btnStat3Down.overlayImg = "";
            this.btnStat3Down.overlayPadding = {x:0, y:0};
            this.btnStat3Down.selected = false;
            this.btnStat3Down.toggle = false;
            this.btnStat3Down.visible = true;
            try
            {
                this.btnStat3Down["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat4Up_charInfo_button_0()
        {
            try
            {
                this.btnStat4Up["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat4Up.autoRepeat = true;
            this.btnStat4Up.autoSize = "none";
            this.btnStat4Up.enabled = true;
            this.btnStat4Up.focusable = false;
            this.btnStat4Up.groupName = "";
            this.btnStat4Up.label = "";
            this.btnStat4Up.overlayAlign = "none";
            this.btnStat4Up.overlayImg = "";
            this.btnStat4Up.overlayPadding = {x:0, y:0};
            this.btnStat4Up.selected = false;
            this.btnStat4Up.toggle = false;
            this.btnStat4Up.visible = true;
            try
            {
                this.btnStat4Up["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat4Down_charInfo_button_0()
        {
            try
            {
                this.btnStat4Down["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat4Down.autoRepeat = true;
            this.btnStat4Down.autoSize = "none";
            this.btnStat4Down.enabled = true;
            this.btnStat4Down.focusable = false;
            this.btnStat4Down.groupName = "";
            this.btnStat4Down.label = "";
            this.btnStat4Down.overlayAlign = "none";
            this.btnStat4Down.overlayImg = "";
            this.btnStat4Down.overlayPadding = {x:0, y:0};
            this.btnStat4Down.selected = false;
            this.btnStat4Down.toggle = false;
            this.btnStat4Down.visible = true;
            try
            {
                this.btnStat4Down["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat5Up_charInfo_button_0()
        {
            try
            {
                this.btnStat5Up["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat5Up.autoRepeat = true;
            this.btnStat5Up.autoSize = "none";
            this.btnStat5Up.enabled = true;
            this.btnStat5Up.focusable = false;
            this.btnStat5Up.groupName = "";
            this.btnStat5Up.label = "";
            this.btnStat5Up.overlayAlign = "none";
            this.btnStat5Up.overlayImg = "";
            this.btnStat5Up.overlayPadding = {x:0, y:0};
            this.btnStat5Up.selected = false;
            this.btnStat5Up.toggle = false;
            this.btnStat5Up.visible = true;
            try
            {
                this.btnStat5Up["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStat5Down_charInfo_button_0()
        {
            try
            {
                this.btnStat5Down["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStat5Down.autoRepeat = true;
            this.btnStat5Down.autoSize = "none";
            this.btnStat5Down.enabled = true;
            this.btnStat5Down.focusable = false;
            this.btnStat5Down.groupName = "";
            this.btnStat5Down.label = "";
            this.btnStat5Down.overlayAlign = "none";
            this.btnStat5Down.overlayImg = "";
            this.btnStat5Down.overlayPadding = {x:0, y:0};
            this.btnStat5Down.selected = false;
            this.btnStat5Down.toggle = false;
            this.btnStat5Down.visible = true;
            try
            {
                this.btnStat5Down["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot11_charInfo_button_0()
        {
            try
            {
                this.slot11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot11.overlayImg = "ring_symbol";
            this.slot11.visible = true;
            try
            {
                this.slot11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelAddOn_charInfo_button_0()
        {
            try
            {
                this.labelAddOn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelAddOn.autoSize = "right";
            this.labelAddOn.autoSizeEnable = false;
            this.labelAddOn.enabled = true;
            this.labelAddOn.text = "";
            this.labelAddOn.visible = true;
            try
            {
                this.labelAddOn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnAddOn_charInfo_button_0()
        {
            try
            {
                this.btnAddOn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAddOn.autoRepeat = false;
            this.btnAddOn.autoSize = "none";
            this.btnAddOn.enabled = true;
            this.btnAddOn.focusable = false;
            this.btnAddOn.groupName = "";
            this.btnAddOn.label = "";
            this.btnAddOn.overlayAlign = "none";
            this.btnAddOn.overlayImg = "";
            this.btnAddOn.overlayPadding = {x:0, y:0};
            this.btnAddOn.selected = false;
            this.btnAddOn.toggle = true;
            this.btnAddOn.visible = true;
            try
            {
                this.btnAddOn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfPoint_charInfo_button_0()
        {
            try
            {
                this.tfPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfPoint.autoSize = "center";
            this.tfPoint.autoSizeEnable = false;
            this.tfPoint.enabled = true;
            this.tfPoint.text = "";
            this.tfPoint.visible = true;
            try
            {
                this.tfPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfPointVal_charInfo_button_0()
        {
            try
            {
                this.tfPointVal["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfPointVal.autoSize = "center";
            this.tfPointVal.autoSizeEnable = false;
            this.tfPointVal.enabled = true;
            this.tfPointVal.text = "";
            this.tfPointVal.visible = true;
            try
            {
                this.tfPointVal["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfSchoolClass_charInfo_button_0()
        {
            try
            {
                this.tfSchoolClass["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfSchoolClass.autoSize = "center";
            this.tfSchoolClass.autoSizeEnable = false;
            this.tfSchoolClass.enabled = true;
            this.tfSchoolClass.text = "";
            this.tfSchoolClass.visible = true;
            try
            {
                this.tfSchoolClass["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_skill_type_a_charInfo_button_0()
        {
            try
            {
                this.skill_type_a["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.skill_type_a.autoRepeat = false;
            this.skill_type_a.autoSize = "none";
            this.skill_type_a.enabled = true;
            this.skill_type_a.focusable = true;
            this.skill_type_a.groupName = "skill_type_group";
            this.skill_type_a.label = "A";
            this.skill_type_a.overlayAlign = "none";
            this.skill_type_a.overlayImg = "";
            this.skill_type_a.overlayPadding = {x:0, y:0};
            this.skill_type_a.selected = false;
            this.skill_type_a.toggle = true;
            this.skill_type_a.visible = true;
            try
            {
                this.skill_type_a["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_skill_type_b_charInfo_button_0()
        {
            try
            {
                this.skill_type_b["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.skill_type_b.autoRepeat = false;
            this.skill_type_b.autoSize = "none";
            this.skill_type_b.enabled = true;
            this.skill_type_b.focusable = true;
            this.skill_type_b.groupName = "skill_type_group";
            this.skill_type_b.label = "B";
            this.skill_type_b.overlayAlign = "none";
            this.skill_type_b.overlayImg = "";
            this.skill_type_b.overlayPadding = {x:0, y:0};
            this.skill_type_b.selected = false;
            this.skill_type_b.toggle = true;
            this.skill_type_b.visible = true;
            try
            {
                this.skill_type_b["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_skill_type_c_charInfo_button_0()
        {
            try
            {
                this.skill_type_c["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.skill_type_c.autoRepeat = false;
            this.skill_type_c.autoSize = "none";
            this.skill_type_c.enabled = true;
            this.skill_type_c.focusable = true;
            this.skill_type_c.groupName = "skill_type_group";
            this.skill_type_c.label = "C";
            this.skill_type_c.overlayAlign = "none";
            this.skill_type_c.overlayImg = "";
            this.skill_type_c.overlayPadding = {x:0, y:0};
            this.skill_type_c.selected = false;
            this.skill_type_c.toggle = true;
            this.skill_type_c.visible = true;
            try
            {
                this.skill_type_c["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_skill_type_d_charInfo_button_0()
        {
            try
            {
                this.skill_type_d["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.skill_type_d.autoRepeat = false;
            this.skill_type_d.autoSize = "none";
            this.skill_type_d.enabled = true;
            this.skill_type_d.focusable = true;
            this.skill_type_d.groupName = "skill_type_group";
            this.skill_type_d.label = "D";
            this.skill_type_d.overlayAlign = "none";
            this.skill_type_d.overlayImg = "";
            this.skill_type_d.overlayPadding = {x:0, y:0};
            this.skill_type_d.selected = false;
            this.skill_type_d.toggle = true;
            this.skill_type_d.visible = true;
            try
            {
                this.skill_type_d["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_skill_type_e_charInfo_button_0()
        {
            try
            {
                this.skill_type_e["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.skill_type_e.autoRepeat = false;
            this.skill_type_e.autoSize = "none";
            this.skill_type_e.enabled = true;
            this.skill_type_e.focusable = true;
            this.skill_type_e.groupName = "skill_type_group";
            this.skill_type_e.label = "E";
            this.skill_type_e.overlayAlign = "none";
            this.skill_type_e.overlayImg = "";
            this.skill_type_e.overlayPadding = {x:0, y:0};
            this.skill_type_e.selected = false;
            this.skill_type_e.toggle = true;
            this.skill_type_e.visible = true;
            try
            {
                this.skill_type_e["componentInspectorSetting"] = false;
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
