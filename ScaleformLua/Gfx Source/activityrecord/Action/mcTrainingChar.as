package 
{
    import flash.display.*;

    dynamic public class mcTrainingChar extends MovieClip
    {
        public var TrIconNum:MovieClip;
        public var imgChar:MovieClip;
        public var TrProgressSlot:MovieClip;
        public var imgTraining:MovieClip;
        public var imgEnd:MovieClip;
        public var charNum:uint;
        public var charClassIndex:int;
        public var trainingCount:int;
        public var completeTrainingCount:int;
        public var isSelected:Boolean;

        public function mcTrainingChar()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function get selected() : Boolean
        {
            return this.isSelected;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            this.isSelected = param1;
            this.updateState();
            return;
        }// end function

        public function updateState() : void
        {
            this.imgTraining.visible = this.trainingCount > 0;
            this.imgEnd.visible = this.completeTrainingCount > 0;
            this.TrProgressSlot.gotoAndStop(this.selected == true ? ("select") : ("default"));
            this.SetClass(this.charClassIndex);
            return;
        }// end function

        public function SetClass(param1:int) : void
        {
            this.charClassIndex = param1;
            var _loc_2:* = "class" + param1;
            if (this.isSelected == false)
            {
                _loc_2 = _loc_2 + "_off";
            }
            this.imgChar.gotoAndStop(_loc_2);
            return;
        }// end function

        function frame1()
        {
            this.TrIconNum.mouseEnabled = false;
            this.imgChar.mouseEnabled = false;
            this.TrProgressSlot.mouseEnabled = false;
            this.charNum = 0;
            this.charClassIndex = 0;
            this.trainingCount = 0;
            this.completeTrainingCount = 0;
            this.isSelected = false;
            return;
        }// end function

    }
}
