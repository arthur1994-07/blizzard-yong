package PostBoxPropose_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class Send_propose_3 extends MovieClip
    {
        public var ProInfo:TextField;
        public var TitlesendProDesign:Label;
        public var sendProDesign:DropdownMenu;
        public var TitleSendProContents:Label;
        public var SendProContents:TextArea;
        public var PostDesign:MovieClip;
        public var bytes:Label;
        public var sendButton:Button;
        public var CancelButton:Button;

        public function Send_propose_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_bytes_Send_propose_text_0();
            this.__setProp_TitlesendProDesign_Send_propose_text_0();
            return;
        }// end function

        function __setProp_bytes_Send_propose_text_0()
        {
            try
            {
                this.bytes["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.bytes.autoSize = "right";
            this.bytes.autoSizeEnable = false;
            this.bytes.enabled = true;
            this.bytes.text = "";
            this.bytes.visible = true;
            try
            {
                this.bytes["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TitlesendProDesign_Send_propose_text_0()
        {
            try
            {
                this.TitlesendProDesign["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TitlesendProDesign.autoSize = "right";
            this.TitlesendProDesign.autoSizeEnable = false;
            this.TitlesendProDesign.enabled = true;
            this.TitlesendProDesign.text = "";
            this.TitlesendProDesign.visible = true;
            try
            {
                this.TitlesendProDesign["componentInspectorSetting"] = false;
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
