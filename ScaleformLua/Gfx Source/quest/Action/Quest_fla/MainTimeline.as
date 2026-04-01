package Quest_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var QuestAction:MovieClip;
        public var CompleteButton:Button;
        public var GiveUpButton:Button;
        public var QuestRegistration:Label;
        public var RewordTitl:Label;
        public var RewordTextField:TextArea;
        public var RewardItem1:Slot;
        public var RewardItem2:Slot;
        public var RewardItem3:Slot;
        public var RewardItem4:Slot;
        public var RewardItem5:Slot;
        public var RewardItem6:Slot;
        public var RewardItem7:Slot;
        public var RewardItem8:Slot;
        public var QuestList_run:ScrollingList;
        public var QuestList_end:ScrollingList;
        public var QuestTabPage:ButtonBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_QuestList_end_Scene1_QuestList_End_0();
            this.__setProp_QuestList_run_Scene1_QuestList_Run_0();
            this.__setProp_RewordTextField_Scene1_Reword_0();
            this.__setProp_QuestRegistration_Scene1_ChackQuestNum_0();
            this.__setProp_QuestTabPage_Scene1_Tab_0();
            this.__setProp_GiveUpButton_Scene1_Button_0();
            this.__setProp_CompleteButton_Scene1_Button_0();
            return;
        }// end function

        function __setProp_QuestList_end_Scene1_QuestList_End_0()
        {
            try
            {
                this.QuestList_end["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.QuestList_end.enabled = true;
            this.QuestList_end.focusable = true;
            this.QuestList_end.itemRendererName = "TreeItemRenderer";
            this.QuestList_end.itemRendererInstanceName = "";
            this.QuestList_end.margin = 0;
            this.QuestList_end.multiSelect = false;
            this.QuestList_end.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.QuestList_end.rowHeight = 24;
            this.QuestList_end.scrollBar = "DefaultScrollBar";
            this.QuestList_end.treeButtonClassName = "TreeButton";
            this.QuestList_end.treeButtonGap = 15;
            this.QuestList_end.treeCheckBoxClassName = "";
            this.QuestList_end.treeList = true;
            this.QuestList_end.visible = true;
            this.QuestList_end.wrapping = "normal";
            try
            {
                this.QuestList_end["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestList_run_Scene1_QuestList_Run_0()
        {
            try
            {
                this.QuestList_run["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.QuestList_run.enabled = true;
            this.QuestList_run.focusable = true;
            this.QuestList_run.itemRendererName = "TreeItemRenderer";
            this.QuestList_run.itemRendererInstanceName = "";
            this.QuestList_run.margin = 0;
            this.QuestList_run.multiSelect = false;
            this.QuestList_run.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.QuestList_run.rowHeight = 24;
            this.QuestList_run.scrollBar = "DefaultScrollBar";
            this.QuestList_run.treeButtonClassName = "TreeButton";
            this.QuestList_run.treeButtonGap = 15;
            this.QuestList_run.treeCheckBoxClassName = "TreeCheckBox";
            this.QuestList_run.treeList = true;
            this.QuestList_run.visible = true;
            this.QuestList_run.wrapping = "normal";
            try
            {
                this.QuestList_run["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RewordTextField_Scene1_Reword_0()
        {
            try
            {
                this.RewordTextField["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RewordTextField.defaultText = "";
            this.RewordTextField.displayAsPassword = false;
            this.RewordTextField.editable = false;
            this.RewordTextField.enabled = true;
            this.RewordTextField.focusable = false;
            this.RewordTextField.maxByte = 0;
            this.RewordTextField.maxChars = 0;
            this.RewordTextField.minThumbSize = 1;
            this.RewordTextField.OnlyNumber = false;
            this.RewordTextField.Restrict = "all";
            this.RewordTextField.RestrictAddOn = "";
            this.RewordTextField.scrollBar = "DefaultScrollBar";
            this.RewordTextField.text = "";
            this.RewordTextField.textAlign = "left";
            this.RewordTextField.thumbOffset = {top:0, bottom:0};
            this.RewordTextField.visible = true;
            try
            {
                this.RewordTextField["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestRegistration_Scene1_ChackQuestNum_0()
        {
            try
            {
                this.QuestRegistration["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.QuestRegistration.autoSize = "right";
            this.QuestRegistration.enabled = true;
            this.QuestRegistration.text = "";
            this.QuestRegistration.visible = true;
            try
            {
                this.QuestRegistration["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestTabPage_Scene1_Tab_0()
        {
            try
            {
                this.QuestTabPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.QuestTabPage.autoSize = "none";
            this.QuestTabPage.buttonWidth = 120;
            this.QuestTabPage.direction = "horizontal";
            this.QuestTabPage.enabled = true;
            this.QuestTabPage.focusable = false;
            this.QuestTabPage.itemRendererName = "TabButton";
            this.QuestTabPage.preventAutoSize = false;
            this.QuestTabPage.spacing = 2;
            this.QuestTabPage.visible = true;
            try
            {
                this.QuestTabPage["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GiveUpButton_Scene1_Button_0()
        {
            try
            {
                this.GiveUpButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GiveUpButton.autoRepeat = false;
            this.GiveUpButton.autoSize = "none";
            this.GiveUpButton.enabled = true;
            this.GiveUpButton.focusable = false;
            this.GiveUpButton.groupName = "";
            this.GiveUpButton.label = "";
            this.GiveUpButton.overlayAlign = "none";
            this.GiveUpButton.overlayImg = "";
            this.GiveUpButton.overlayPadding = {x:0, y:0};
            this.GiveUpButton.preventAutoSize = false;
            this.GiveUpButton.selected = false;
            this.GiveUpButton.toggle = false;
            this.GiveUpButton.visible = true;
            try
            {
                this.GiveUpButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CompleteButton_Scene1_Button_0()
        {
            try
            {
                this.CompleteButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CompleteButton.autoRepeat = false;
            this.CompleteButton.autoSize = "none";
            this.CompleteButton.enabled = true;
            this.CompleteButton.focusable = false;
            this.CompleteButton.groupName = "";
            this.CompleteButton.label = "";
            this.CompleteButton.overlayAlign = "none";
            this.CompleteButton.overlayImg = "";
            this.CompleteButton.overlayPadding = {x:0, y:0};
            this.CompleteButton.preventAutoSize = false;
            this.CompleteButton.selected = false;
            this.CompleteButton.toggle = false;
            this.CompleteButton.visible = true;
            try
            {
                this.CompleteButton["componentInspectorSetting"] = false;
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
