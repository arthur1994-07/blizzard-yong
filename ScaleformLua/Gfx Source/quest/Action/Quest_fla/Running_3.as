package Quest_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class Running_3 extends MovieClip
    {
        public var CollectionTitle:Label;
        public var MinutelyTitle:Label;
        public var ContentTitle:Label;
        public var StapText:TextArea;
        public var DetailText:TextArea;
        public var ContentText:TextArea;
        public var QuestItem1:Slot;
        public var QuestItem2:Slot;
        public var QuestItem3:Slot;
        public var QuestItem4:Slot;
        public var QuestItem5:Slot;
        public var QuestItem6:Slot;
        public var QuestItem7:Slot;
        public var QuestItem8:Slot;

        public function Running_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ContentText_Running_TextField_0();
            this.__setProp_DetailText_Running_TextField_0();
            this.__setProp_StapText_Running_TextField_0();
            return;
        }// end function

        function __setProp_ContentText_Running_TextField_0()
        {
            try
            {
                this.ContentText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ContentText.defaultText = "";
            this.ContentText.displayAsPassword = false;
            this.ContentText.editable = false;
            this.ContentText.enabled = true;
            this.ContentText.focusable = false;
            this.ContentText.maxByte = 0;
            this.ContentText.maxChars = 0;
            this.ContentText.minThumbSize = 1;
            this.ContentText.OnlyNumber = false;
            this.ContentText.Restrict = "all";
            this.ContentText.RestrictAddOn = "";
            this.ContentText.scrollBar = "DefaultScrollBar";
            this.ContentText.text = "";
            this.ContentText.textAlign = "left";
            this.ContentText.thumbOffset = {top:0, bottom:0};
            this.ContentText.visible = true;
            try
            {
                this.ContentText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DetailText_Running_TextField_0()
        {
            try
            {
                this.DetailText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DetailText.defaultText = "";
            this.DetailText.displayAsPassword = false;
            this.DetailText.editable = false;
            this.DetailText.enabled = true;
            this.DetailText.focusable = false;
            this.DetailText.maxByte = 0;
            this.DetailText.maxChars = 0;
            this.DetailText.minThumbSize = 1;
            this.DetailText.OnlyNumber = false;
            this.DetailText.Restrict = "all";
            this.DetailText.RestrictAddOn = "";
            this.DetailText.scrollBar = "DefaultScrollBar";
            this.DetailText.text = "";
            this.DetailText.textAlign = "left";
            this.DetailText.thumbOffset = {top:0, bottom:0};
            this.DetailText.visible = true;
            try
            {
                this.DetailText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_StapText_Running_TextField_0()
        {
            try
            {
                this.StapText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.StapText.defaultText = "";
            this.StapText.displayAsPassword = false;
            this.StapText.editable = false;
            this.StapText.enabled = true;
            this.StapText.focusable = false;
            this.StapText.maxByte = 0;
            this.StapText.maxChars = 0;
            this.StapText.minThumbSize = 1;
            this.StapText.OnlyNumber = false;
            this.StapText.Restrict = "all";
            this.StapText.RestrictAddOn = "";
            this.StapText.scrollBar = "DefaultScrollBar";
            this.StapText.text = "";
            this.StapText.textAlign = "left";
            this.StapText.thumbOffset = {top:0, bottom:0};
            this.StapText.visible = true;
            try
            {
                this.StapText["componentInspectorSetting"] = false;
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
