package PetGiudeBook_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var PetListEx4:petlist;
        public var PetListEx5:petlist;
        public var PetList5:ListItemRenderer_pet;
        public var PetList4:ListItemRenderer_pet;
        public var PetList6:ListItemRenderer_pet;
        public var PetList1:ListItemRenderer_pet;
        public var PetListEx2:petlist;
        public var PetListEx3:petlist;
        public var PetList3:ListItemRenderer_pet;
        public var PetList2:ListItemRenderer_pet;
        public var PetListEx1:petlist;
        public var PetListEx6:petlist;
        public var TapAllPet:Button;
        public var TapNormalPet:Button;
        public var TabHighPet:Button;
        public var LabelPetGuideTip:Label;
        public var LabelPetImgTitle:Label;
        public var LabelPetNameTitle:Label;
        public var LabelPetRewardTitle:Label;
        public var LabelName:Label;
        public var LabelPetName:Label;
        public var LabelType:Label;
        public var LabelPetType:Label;
        public var LabelGrade:Label;
        public var LabelPetGrade:Label;
        public var LabelSkil:Label;
        public var tfPetDescription:TextArea;
        public var PetSkilSlot1:Slot;
        public var PetSkilSlot2:Slot;
        public var PetListBar:ScrollBar;
        public var PetDescriptionBar:ScrollBar;
        public var PetScrollingList:ScrollingList;
        public var PetImg:MovieClip;
        public var PetImage:MImage;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_PetListBar_Scene1_Layer2_0();
            this.__setProp_PetScrollingList_Scene1_Layer2_0();
            this.__setProp_PetDescriptionBar_Scene1_Layer2_0();
            this.__setProp_tfPetDescription_Scene1_text_0();
            return;
        }// end function

        function __setProp_PetListBar_Scene1_Layer2_0()
        {
            try
            {
                this.PetListBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.PetListBar.enabled = true;
            this.PetListBar.minThumbSize = 10;
            this.PetListBar.offsetBottom = 0;
            this.PetListBar.offsetTop = 0;
            this.PetListBar.scrollTarget = "PetScrollingList";
            this.PetListBar.trackMode = "scrollPage";
            this.PetListBar.visible = true;
            try
            {
                this.PetListBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_PetScrollingList_Scene1_Layer2_0()
        {
            try
            {
                this.PetScrollingList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.PetScrollingList.enabled = true;
            this.PetScrollingList.focusable = true;
            this.PetScrollingList.itemRendererName = "";
            this.PetScrollingList.itemRendererInstanceName = "PetList";
            this.PetScrollingList.margin = 0;
            this.PetScrollingList.multiSelect = false;
            this.PetScrollingList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.PetScrollingList.rowHeight = 0;
            this.PetScrollingList.scrollBar = "PetListBar";
            this.PetScrollingList.treeButtonClassName = "";
            this.PetScrollingList.treeButtonGap = -1;
            this.PetScrollingList.treeCheckBoxClassName = "";
            this.PetScrollingList.treeList = false;
            this.PetScrollingList.visible = true;
            this.PetScrollingList.wrapping = "normal";
            try
            {
                this.PetScrollingList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_PetDescriptionBar_Scene1_Layer2_0()
        {
            try
            {
                this.PetDescriptionBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.PetDescriptionBar.enabled = true;
            this.PetDescriptionBar.minThumbSize = 10;
            this.PetDescriptionBar.offsetBottom = 0;
            this.PetDescriptionBar.offsetTop = 0;
            this.PetDescriptionBar.scrollTarget = "tfPetDescription";
            this.PetDescriptionBar.trackMode = "scrollPage";
            this.PetDescriptionBar.visible = true;
            try
            {
                this.PetDescriptionBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfPetDescription_Scene1_text_0()
        {
            try
            {
                this.tfPetDescription["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfPetDescription.defaultText = "";
            this.tfPetDescription.displayAsPassword = false;
            this.tfPetDescription.editable = true;
            this.tfPetDescription.enabled = true;
            this.tfPetDescription.focusable = true;
            this.tfPetDescription.maxByte = 0;
            this.tfPetDescription.maxChars = 0;
            this.tfPetDescription.minThumbSize = 1;
            this.tfPetDescription.OnlyNumber = false;
            this.tfPetDescription.Restrict = "all";
            this.tfPetDescription.RestrictAddOn = "";
            this.tfPetDescription.scrollBar = "PetDescriptionBar";
            this.tfPetDescription.text = "";
            this.tfPetDescription.textAlign = "left";
            this.tfPetDescription.thumbOffset = {top:0, bottom:0};
            this.tfPetDescription.visible = true;
            try
            {
                this.tfPetDescription["componentInspectorSetting"] = false;
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
