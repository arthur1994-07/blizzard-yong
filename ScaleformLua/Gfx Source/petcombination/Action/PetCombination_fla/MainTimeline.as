package PetCombination_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var tfPetType1:TextField;
        public var SlotPetRandom:pet_randomQ;
        public var tfPetMixTip1:TextField;
        public var tfPetMixTip2:TextField;
        public var tfPetType2:TextField;
        public var labelPetTypeSelect:Label;
        public var labelPetTypeTitle1:Label;
        public var labelPetTypeTitle2:Label;
        public var labelPetTypeRandom:Label;
        public var labelPetMainSkilSelect:Label;
        public var labelPetSubSkilSelect:Label;
        public var labelPetMainSkil:Label;
        public var labelPetSubSkil:Label;
        public var labelPetSubSkilList1:Label;
        public var labelPetSubSkilList2:Label;
        public var labelPetSubSkilList3:Label;
        public var labelPetSubSkilList4:Label;
        public var labelPetSubSkilList5:Label;
        public var labelPetSubSkilList6:Label;
        public var CbPetType1:CheckBox;
        public var CbPetType2:CheckBox;
        public var CbPetType3:CheckBox;
        public var CbPetMainSkil1:CheckBox;
        public var CbPetMainSkil2:CheckBox;
        public var CbPetMainSkil3:CheckBox;
        public var CbPetMainSkil4:CheckBox;
        public var CbPetMainSkil5:CheckBox;
        public var CbPetMainSkil6:CheckBox;
        public var CbPetSubSkil1:CheckBox;
        public var CbPetSubSkil2:CheckBox;
        public var CbPetSubSkil3:CheckBox;
        public var CbPetSubSkil4:CheckBox;
        public var CbPetSubSkil5:CheckBox;
        public var CbPetSubSkil6:CheckBox;
        public var SlotPetMix1:Slot;
        public var SlotPetMix2:Slot;
        public var SlotPetType1:Slot;
        public var SlotPetType2:Slot;
        public var SlotPetMainSkil1:Slot;
        public var SlotPetMainSkil2:Slot;
        public var SlotPetMainSkil3:Slot;
        public var SlotPetMainSkil4:Slot;
        public var SlotPetMainSkil5:Slot;
        public var SlotPetMainSkil6:Slot;
        public var btnPetMixOk:Button;
        public var btnPetMixCancel:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelPetMainSkil_Scene1_Layer2_0();
            this.__setProp_labelPetSubSkil_Scene1_Layer2_0();
            return;
        }// end function

        function __setProp_labelPetMainSkil_Scene1_Layer2_0()
        {
            try
            {
                this.labelPetMainSkil["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPetMainSkil.autoSize = "center";
            this.labelPetMainSkil.autoSizeEnable = false;
            this.labelPetMainSkil.enabled = true;
            this.labelPetMainSkil.text = "";
            this.labelPetMainSkil.visible = true;
            try
            {
                this.labelPetMainSkil["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPetSubSkil_Scene1_Layer2_0()
        {
            try
            {
                this.labelPetSubSkil["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPetSubSkil.autoSize = "center";
            this.labelPetSubSkil.autoSizeEnable = false;
            this.labelPetSubSkil.enabled = true;
            this.labelPetSubSkil.text = "";
            this.labelPetSubSkil.visible = true;
            try
            {
                this.labelPetSubSkil["componentInspectorSetting"] = false;
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
