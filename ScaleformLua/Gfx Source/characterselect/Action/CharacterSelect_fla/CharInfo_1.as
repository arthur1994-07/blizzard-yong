package CharacterSelect_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class CharInfo_1 extends MovieClip
    {
        public var tfSelectInfo:TextField;
        public var tfTendency:TextField;
        public var btns:MovieClip;
        public var tfExp:TextField;
        public var labelExp:Label;
        public var labelTendency:Label;
        public var barExp:StatusIndicator;
        public var barTendency:StatusIndicator;
        public var listChar:MMaskedList;

        public function CharInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listChar_CharInfo_list_0();
            return;
        }// end function

        function __setProp_listChar_CharInfo_list_0()
        {
            try
            {
                this.listChar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listChar.enabled = true;
            this.listChar.itemRendererName = "MaskedListItemRenderer_CharSel";
            this.listChar.itemRendererOffset = {x:0, y:0};
            this.listChar.multiSelectable = false;
            this.listChar.rowCount = 1;
            this.listChar.scrollBarName = "NewScrollBar";
            this.listChar.scrollSpeed = 5;
            this.listChar.visible = true;
            try
            {
                this.listChar["componentInspectorSetting"] = false;
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
