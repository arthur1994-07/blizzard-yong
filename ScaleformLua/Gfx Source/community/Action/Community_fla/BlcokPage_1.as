package Community_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class BlcokPage_1 extends MovieClip
    {
        public var list:MMaskedList;
        public var friendInput:TextInput;
        public var block:Button;
        public var blockRelease:Button;
        public var count:Label;

        public function BlcokPage_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_block_BlcokPage_button_0();
            this.__setProp_blockRelease_BlcokPage_button_0();
            this.__setProp_count_BlcokPage_count_0();
            this.__setProp_list_BlcokPage_tilelist_0();
            return;
        }// end function

        function __setProp_block_BlcokPage_button_0()
        {
            try
            {
                this.block["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.block.autoRepeat = false;
            this.block.autoSize = "none";
            this.block.enabled = true;
            this.block.focusable = false;
            this.block.groupName = "";
            this.block.label = "";
            this.block.overlayAlign = "none";
            this.block.overlayImg = "";
            this.block.overlayPadding = {x:0, y:0};
            this.block.selected = false;
            this.block.toggle = false;
            this.block.visible = true;
            try
            {
                this.block["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_blockRelease_BlcokPage_button_0()
        {
            try
            {
                this.blockRelease["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.blockRelease.autoRepeat = false;
            this.blockRelease.autoSize = "none";
            this.blockRelease.enabled = true;
            this.blockRelease.focusable = false;
            this.blockRelease.groupName = "";
            this.blockRelease.label = "";
            this.blockRelease.overlayAlign = "none";
            this.blockRelease.overlayImg = "";
            this.blockRelease.overlayPadding = {x:0, y:0};
            this.blockRelease.selected = false;
            this.blockRelease.toggle = false;
            this.blockRelease.visible = true;
            try
            {
                this.blockRelease["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_count_BlcokPage_count_0()
        {
            try
            {
                this.count["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.count.autoSize = "left";
            this.count.autoSizeEnable = false;
            this.count.enabled = true;
            this.count.text = "";
            this.count.visible = true;
            try
            {
                this.count["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_BlcokPage_tilelist_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "BlockMaskedItemRenderer";
            this.list.itemRendererOffset = {x:0, y:0};
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 10;
            this.list.visible = true;
            try
            {
                this.list["componentInspectorSetting"] = false;
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
