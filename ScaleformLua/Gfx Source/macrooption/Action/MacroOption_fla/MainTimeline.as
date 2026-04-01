package MacroOption_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var cbSkillTary_F1:CheckBox;
        public var cbSkillTary_F2:CheckBox;
        public var cbSkillTary_F3:CheckBox;
        public var cbSkillTary_F4:CheckBox;
        public var cbPetFoodEnable:CheckBox;
        public var cbReturnOp_ReaminDrugCount:CheckBox;
        public var cbReturnOp_ReaminMacroTime:CheckBox;
        public var btStartEnd:Button;
        public var cbSkillTary_F1_text:Label;
        public var cbSkillTary_F2_text:Label;
        public var cbSkillTary_F3_text:Label;
        public var cbSkillTary_F4_text:Label;
        public var cbPetFoodEnable_text:Label;
        public var cbReturnOp_ReaminDrugCount_text:Label;
        public var cbReturnOp_ReaminMacroTime_text:Label;
        public var slotLunchBox0:Slot;
        public var slotLunchBox1:Slot;
        public var lableLunchBoxRegistration:Label;
        public var labelObjectiveExp:Label;
        public var textInputObjectiveExp:TextInput;
        public var labelExpPercent:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_textInputObjectiveExp_Scene1_Boxes_0();
            return;
        }// end function

        function __setProp_textInputObjectiveExp_Scene1_Boxes_0()
        {
            try
            {
                this.textInputObjectiveExp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.textInputObjectiveExp.defaultText = "";
            this.textInputObjectiveExp.displayAsPassword = false;
            this.textInputObjectiveExp.editable = true;
            this.textInputObjectiveExp.enabled = true;
            this.textInputObjectiveExp.focusable = true;
            this.textInputObjectiveExp.maxByte = 0;
            this.textInputObjectiveExp.maxChars = 3;
            this.textInputObjectiveExp.OnlyNumber = true;
            this.textInputObjectiveExp.Restrict = "number";
            this.textInputObjectiveExp.RestrictAddOn = "";
            this.textInputObjectiveExp.text = "";
            this.textInputObjectiveExp.textAlign = "left";
            this.textInputObjectiveExp.visible = true;
            try
            {
                this.textInputObjectiveExp["componentInspectorSetting"] = false;
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
