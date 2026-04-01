package ActivityRecord_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class AttendancePage_Contents_4 extends MovieClip
    {
        public var Task0_Caption:AttendancePage_TitleText;
        public var Task1_Caption:AttendancePage_TitleText;
        public var Task2_Caption:AttendancePage_TitleText;
        public var Task3_Caption:AttendancePage_TitleText;
        public var Task2_Progress:AttendancePage_AwardText;
        public var Task3_Progress:AttendancePage_AwardText;
        public var Task0_Progress:AttendancePage_AwardText;
        public var Task1_Progress:AttendancePage_AwardText;
        public var Task0_Slot:Slot;
        public var Task1_Slot:Slot;
        public var Task2_Slot:Slot;
        public var Task3_Slot:Slot;
        public var Task0_Button:Button;
        public var Task1_Button:Button;
        public var Task2_Button:Button;
        public var Task3_Button:Button;
        public var labelComplete0:Label;
        public var labelComplete1:Label;
        public var labelComplete2:Label;
        public var labelComplete3:Label;
        public var Task0_Award:Label;
        public var Task1_Award:Label;
        public var Task2_Award:Label;
        public var Task3_Award:Label;

        public function AttendancePage_Contents_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelComplete0_AttendancePage_Contents_text_0();
            this.__setProp_labelComplete1_AttendancePage_Contents_text_0();
            this.__setProp_labelComplete2_AttendancePage_Contents_text_0();
            this.__setProp_labelComplete3_AttendancePage_Contents_text_0();
            this.__setProp_Task0_Award_AttendancePage_Contents_text_0();
            this.__setProp_Task1_Award_AttendancePage_Contents_text_0();
            this.__setProp_Task2_Award_AttendancePage_Contents_text_0();
            this.__setProp_Task3_Award_AttendancePage_Contents_text_0();
            this.__setProp_Task0_Button_AttendancePage_Contents_button_0();
            this.__setProp_Task1_Button_AttendancePage_Contents_button_0();
            this.__setProp_Task2_Button_AttendancePage_Contents_button_0();
            this.__setProp_Task3_Button_AttendancePage_Contents_button_0();
            return;
        }// end function

        function __setProp_labelComplete0_AttendancePage_Contents_text_0()
        {
            try
            {
                this.labelComplete0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelComplete0.autoSize = "right";
            this.labelComplete0.autoSizeEnable = false;
            this.labelComplete0.enabled = true;
            this.labelComplete0.text = "";
            this.labelComplete0.visible = true;
            try
            {
                this.labelComplete0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelComplete1_AttendancePage_Contents_text_0()
        {
            try
            {
                this.labelComplete1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelComplete1.autoSize = "right";
            this.labelComplete1.autoSizeEnable = false;
            this.labelComplete1.enabled = true;
            this.labelComplete1.text = "";
            this.labelComplete1.visible = true;
            try
            {
                this.labelComplete1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelComplete2_AttendancePage_Contents_text_0()
        {
            try
            {
                this.labelComplete2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelComplete2.autoSize = "right";
            this.labelComplete2.autoSizeEnable = false;
            this.labelComplete2.enabled = true;
            this.labelComplete2.text = "";
            this.labelComplete2.visible = true;
            try
            {
                this.labelComplete2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelComplete3_AttendancePage_Contents_text_0()
        {
            try
            {
                this.labelComplete3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelComplete3.autoSize = "right";
            this.labelComplete3.autoSizeEnable = false;
            this.labelComplete3.enabled = true;
            this.labelComplete3.text = "";
            this.labelComplete3.visible = true;
            try
            {
                this.labelComplete3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task0_Award_AttendancePage_Contents_text_0()
        {
            try
            {
                this.Task0_Award["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task0_Award.autoSize = "right";
            this.Task0_Award.autoSizeEnable = false;
            this.Task0_Award.enabled = true;
            this.Task0_Award.text = "";
            this.Task0_Award.visible = true;
            try
            {
                this.Task0_Award["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task1_Award_AttendancePage_Contents_text_0()
        {
            try
            {
                this.Task1_Award["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task1_Award.autoSize = "right";
            this.Task1_Award.autoSizeEnable = false;
            this.Task1_Award.enabled = true;
            this.Task1_Award.text = "";
            this.Task1_Award.visible = true;
            try
            {
                this.Task1_Award["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task2_Award_AttendancePage_Contents_text_0()
        {
            try
            {
                this.Task2_Award["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task2_Award.autoSize = "right";
            this.Task2_Award.autoSizeEnable = false;
            this.Task2_Award.enabled = true;
            this.Task2_Award.text = "";
            this.Task2_Award.visible = true;
            try
            {
                this.Task2_Award["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task3_Award_AttendancePage_Contents_text_0()
        {
            try
            {
                this.Task3_Award["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task3_Award.autoSize = "right";
            this.Task3_Award.autoSizeEnable = false;
            this.Task3_Award.enabled = true;
            this.Task3_Award.text = "";
            this.Task3_Award.visible = true;
            try
            {
                this.Task3_Award["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task0_Button_AttendancePage_Contents_button_0()
        {
            try
            {
                this.Task0_Button["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task0_Button.autoRepeat = false;
            this.Task0_Button.autoSize = "none";
            this.Task0_Button.enabled = true;
            this.Task0_Button.focusable = false;
            this.Task0_Button.groupName = "";
            this.Task0_Button.label = "DefautlButton";
            this.Task0_Button.overlayAlign = "none";
            this.Task0_Button.overlayImg = "";
            this.Task0_Button.overlayPadding = {x:0, y:0};
            this.Task0_Button.selected = false;
            this.Task0_Button.toggle = false;
            this.Task0_Button.visible = true;
            try
            {
                this.Task0_Button["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task1_Button_AttendancePage_Contents_button_0()
        {
            try
            {
                this.Task1_Button["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task1_Button.autoRepeat = false;
            this.Task1_Button.autoSize = "none";
            this.Task1_Button.enabled = true;
            this.Task1_Button.focusable = false;
            this.Task1_Button.groupName = "";
            this.Task1_Button.label = "DefautlButton";
            this.Task1_Button.overlayAlign = "none";
            this.Task1_Button.overlayImg = "";
            this.Task1_Button.overlayPadding = {x:0, y:0};
            this.Task1_Button.selected = false;
            this.Task1_Button.toggle = false;
            this.Task1_Button.visible = true;
            try
            {
                this.Task1_Button["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task2_Button_AttendancePage_Contents_button_0()
        {
            try
            {
                this.Task2_Button["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task2_Button.autoRepeat = false;
            this.Task2_Button.autoSize = "none";
            this.Task2_Button.enabled = true;
            this.Task2_Button.focusable = false;
            this.Task2_Button.groupName = "";
            this.Task2_Button.label = "DefautlButton";
            this.Task2_Button.overlayAlign = "none";
            this.Task2_Button.overlayImg = "";
            this.Task2_Button.overlayPadding = {x:0, y:0};
            this.Task2_Button.selected = false;
            this.Task2_Button.toggle = false;
            this.Task2_Button.visible = true;
            try
            {
                this.Task2_Button["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_Task3_Button_AttendancePage_Contents_button_0()
        {
            try
            {
                this.Task3_Button["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Task3_Button.autoRepeat = false;
            this.Task3_Button.autoSize = "none";
            this.Task3_Button.enabled = true;
            this.Task3_Button.focusable = false;
            this.Task3_Button.groupName = "";
            this.Task3_Button.label = "DefautlButton";
            this.Task3_Button.overlayAlign = "none";
            this.Task3_Button.overlayImg = "";
            this.Task3_Button.overlayPadding = {x:0, y:0};
            this.Task3_Button.selected = false;
            this.Task3_Button.toggle = false;
            this.Task3_Button.visible = true;
            try
            {
                this.Task3_Button["componentInspectorSetting"] = false;
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
