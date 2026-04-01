package NPCTalk_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcTalk_1 extends MovieClip
    {
        public var text:TextArea;
        public var scroll:ScrollBar;
        public var answer_scroll:ScrollBar;
        public var list:ScrollingList;
        public var answer1:ListItemRenderer;
        public var answer2:ListItemRenderer;
        public var answer3:ListItemRenderer;
        public var answer4:ListItemRenderer;
        public var answer5:ListItemRenderer;
        public var answer6:ListItemRenderer;
        public var answer7:ListItemRenderer;

        public function mcTalk_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_mcTalk_list_0();
            this.__setProp_answer_scroll_mcTalk_renderer_0();
            this.__setProp_text_mcTalk_asset_0();
            this.__setProp_scroll_mcTalk_asset_0();
            return;
        }// end function

        function __setProp_list_mcTalk_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "answer";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "answer_scroll";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_answer_scroll_mcTalk_renderer_0()
        {
            try
            {
                this.answer_scroll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.answer_scroll.enabled = true;
            this.answer_scroll.minThumbSize = 10;
            this.answer_scroll.offsetBottom = 0;
            this.answer_scroll.offsetTop = 0;
            this.answer_scroll.scrollTarget = "text";
            this.answer_scroll.trackMode = "scrollPage";
            this.answer_scroll.visible = true;
            try
            {
                this.answer_scroll["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_text_mcTalk_asset_0()
        {
            try
            {
                this.text["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.text.defaultText = "";
            this.text.displayAsPassword = false;
            this.text.editable = false;
            this.text.enabled = true;
            this.text.focusable = false;
            this.text.maxByte = 0;
            this.text.maxChars = 0;
            this.text.minThumbSize = 1;
            this.text.OnlyNumber = false;
            this.text.Restrict = "all";
            this.text.RestrictAddOn = "";
            this.text.scrollBar = "scroll";
            this.text.text = "";
            this.text.textAlign = "left";
            this.text.thumbOffset = {top:0, bottom:0};
            this.text.visible = true;
            try
            {
                this.text["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scroll_mcTalk_asset_0()
        {
            try
            {
                this.scroll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scroll.enabled = true;
            this.scroll.minThumbSize = 10;
            this.scroll.offsetBottom = 0;
            this.scroll.offsetTop = 0;
            this.scroll.scrollTarget = "text";
            this.scroll.trackMode = "scrollPage";
            this.scroll.visible = true;
            try
            {
                this.scroll["componentInspectorSetting"] = false;
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
