package ran.ui
{
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.core.*;

    public class LoadingScreen extends MScene
    {
        public var mcGrade:MovieClip;
        public var tfTip:TextField;
        public var name_plane_01:MovieClip;
        public var black_frame_instance:MovieClip;
        public var loading_text_inst:MovieClip;
        public var imgBG:MImage;
        protected var mapText:Dictionary;
        public static const UpdateTextEvent:String = "updateTextEvent";

        public function LoadingScreen()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
            this.mapText = new Dictionary();
            stage.addEventListener(LoadingScreenEvent.UpdateText, this.onUpdateText, false, 0, true);
            return;
        }// end function

        protected function updateTextField(param1:int, param2:String) : void
        {
            var _loc_4:* = null;
            this.mapText[param1].text = param2;
            var _loc_3:* = 0;
            while (_loc_3 < this.mapText[param1].arrTextField.length)
            {
                
                _loc_4 = this.mapText[param1].arrTextField[_loc_3];
                _loc_4.text = param2;
                _loc_3++;
            }
            return;
        }// end function

        protected function addTextField(param1:int, param2:TextField) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (this.mapText[param1] == null)
            {
                _loc_4 = new Array();
                _loc_4.push(param2);
                _loc_5 = new Object();
                _loc_5.text = "";
                _loc_5.arrTextField = _loc_4;
                this.mapText[param1] = _loc_5;
                return;
            }
            param2.text = this.mapText[param1].text;
            var _loc_3:* = 0;
            while (_loc_3 < this.mapText[param1].arrTextField.length)
            {
                
                if (param2 == this.mapText[param1].arrTextField[_loc_3])
                {
                    return;
                }
                _loc_3++;
            }
            this.mapText[param1].arrTextField.push(param2);
            return;
        }// end function

        protected function onUpdateText(event:LoadingScreenEvent) : void
        {
            this.addTextField(event.id, event.tf);
            return;
        }// end function

        public function CF_LoadImage(param1:String) : void
        {
            this.imgBG.LoadImage(param1, 0, 0, imgSizeW, imgSizeH);
            return;
        }// end function

        public function CF_SetText(param1:int, param2:String) : void
        {
            var _loc_3:* = null;
            if (this.mapText[param1] == null)
            {
                _loc_3 = new Object();
                _loc_3.text = param2;
                _loc_3.arrTextField = new Array();
                this.mapText[param1] = _loc_3;
                return;
            }
            this.updateTextField(param1, param2);
            return;
        }// end function

        function frame1()
        {
            addCustomOption(this.imgBG, AlignL | AlignT, SizeNone, ScaleX | ScaleY);
            addCustomOption(this.mcGrade, AlignR | AlignT, SizeNone, ScaleNone);
            addCustomOption(this.name_plane_01, AlignH | AlignT, SizeNone, ScaleNone);
            addCustomOption(this.tfTip, AlignL | AlignB, SizeW, ScaleNone);
            addCustomOption(this.loading_text_inst, AlignR | AlignB, SizeW, ScaleNone);
            this.addTextField(0, this.name_plane_01.namePanel.textField);
            this.addTextField(1, this.tfTip);
            stop();
            this.mcGrade.visible = true;
            this.name_plane_01.visible = false;
            this.tfTip.visible = false;
            return;
        }// end function

        function frame2()
        {
            stop();
            this.mcGrade.visible = false;
            this.name_plane_01.visible = true;
            this.tfTip.visible = true;
            return;
        }// end function

        function frame3()
        {
            stop();
            this.mcGrade.visible = false;
            this.name_plane_01.visible = false;
            this.tfTip.visible = false;
            return;
        }// end function

    }
}
