package ActivityRecord_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.core.*;
    import ran.ui.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.motion.*;

    dynamic public class TrainingPage_24 extends MovieClip
    {
        public var TextTrTitle1:Label;
        public var TextTrTitle2:Label;
        public var TrTip:TextField;
        public var imgBg:MImage;
        public var mcChar1:MovieClip;
        public var mcChar2:MovieClip;
        public var mcChar3:MovieClip;
        public var mcChar4:MovieClip;
        public var mcChar5:MovieClip;
        public var mcChar6:MovieClip;
        public var BtnTrLeft:Button;
        public var BtnTrRight:Button;
        public var list:MMaskedList;
        public var TrTipScrollBar:ScrollBar;
        public const CharViewCount:int = 6;
        public var charData:Array;
        public var currentView:int;
        public var charTrainingData:Dictionary;
        public var selectedChar:MovieClip;

        public function TrainingPage_24()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TrTipScrollBar_TrainingPage_bg_0();
            this.__setProp_list_TrainingPage_list_0();
            return;
        }// end function

        public function CalcTotalView() : int
        {
            var _loc_1:* = this.charData.length - 1;
            if (_loc_1 < 0)
            {
                _loc_1 = 0;
            }
            return _loc_1 / this.CharViewCount;
        }// end function

        public function CalcView(param1:int) : int
        {
            return param1 / this.CharViewCount;
        }// end function

        public function onClickChar(event:MouseEvent) : void
        {
            var _loc_2:* = event.target as MovieClip;
            if (_loc_2 == null)
            {
                return;
            }
            this.SelectChar(_loc_2);
            return;
        }// end function

        public function SelectChar(param1:MovieClip) : void
        {
            param1.selected = true;
            if (this.selectedChar != null && param1 != this.selectedChar)
            {
                this.selectedChar.selected = false;
            }
            this.selectedChar = param1;
            var _loc_2:* = [Util.OBJ_TYPE_UINT];
            var _loc_3:* = [param1.charNum];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_SelectChar", _loc_2, _loc_3);
            return;
        }// end function

        public function onViewLeft(event:ButtonEvent) : void
        {
            var _loc_2:* = this;
            var _loc_3:* = this.currentView - 1;
            _loc_2.currentView = _loc_3;
            if (this.currentView <= 0)
            {
                this.BtnTrLeft.enabled = false;
            }
            if (this.currentView != this.CalcTotalView())
            {
                this.BtnTrRight.enabled = true;
            }
            this.UpdateView();
            return;
        }// end function

        public function onViewRight(event:ButtonEvent) : void
        {
            this.BtnTrLeft.enabled = true;
            var _loc_2:* = this;
            var _loc_3:* = this.currentView + 1;
            _loc_2.currentView = _loc_3;
            if (this.currentView == this.CalcTotalView())
            {
                this.BtnTrRight.enabled = false;
            }
            this.UpdateView();
            return;
        }// end function

        public function SetStaticText(param1:String, param2:String, param3:String) : void
        {
            this.TextTrTitle1.text = param1;
            this.TextTrTitle2.text = param2;
            this.TrTip.text = param3;
            return;
        }// end function

        public function AddChar(param1:Object) : void
        {
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = -1;
            var _loc_3:* = false;
            var _loc_4:* = 0;
            while (_loc_4 < this.charData.length)
            {
                
                if (this.charData[_loc_4].charNum == param1.charNum)
                {
                    return;
                }
                _loc_4++;
            }
            if (_loc_3 == false)
            {
                _loc_2 = this.charData.push(param1) - 1;
            }
            this.BtnTrRight.enabled = this.currentView != this.CalcTotalView();
            var _loc_5:* = _loc_2 / this.CharViewCount;
            if (this.currentView != _loc_5)
            {
                return;
            }
            this.UpdateChar(_loc_2, param1);
            if (_loc_2 % this.CharViewCount == 0)
            {
                this.SelectChar(this.mcChar1);
            }
            return;
        }// end function

        public function UpdateChar(param1:int, param2:Object) : void
        {
            var _loc_7:* = null;
            var _loc_3:* = this.CalcView(param1);
            if (_loc_3 != this.currentView)
            {
                return;
            }
            var _loc_4:* = param1 - _loc_3 * this.CharViewCount;
            var _loc_5:* = "mcChar" + (_loc_4 + 1);
            var _loc_6:* = getChildByName(_loc_5) as MovieClip;
            if (_loc_6 == null)
            {
                return;
            }
            _loc_6.visible = param2 != null;
            if (_loc_6.visible == false)
            {
                return;
            }
            _loc_6.charNum = param2.charNum;
            _loc_6.trainingCount = param2.trainingCount;
            _loc_6.completeTrainingCount = param2.completeTrainingCount;
            _loc_6.updateState();
            var _loc_8:* = _loc_6.getChildByName("TrIconNum") as MovieClip;
            if (_loc_8 != null)
            {
                _loc_7 = _loc_8.getChildByName("tfTrNum") as TextField;
                if (_loc_7 != null)
                {
                    _loc_7.text = param2.stamina + "/" + param2.maxStamina;
                }
            }
            var _loc_9:* = _loc_6.getChildByName("TrProgressSlot") as MovieClip;
            if (_loc_9 != null)
            {
                _loc_7 = _loc_9.getChildByName("tfUserName") as TextField;
                if (_loc_7 != null)
                {
                    _loc_7.text = param2.charName;
                }
                _loc_7 = _loc_9.getChildByName("tfUserLv") as TextField;
                if (_loc_7 != null)
                {
                    _loc_7.text = "Lv " + param2.charLevel;
                }
            }
            _loc_6.SetClass(param2.classIndex);
            return;
        }// end function

        public function UpdateView() : void
        {
            var _loc_2:* = 0;
            if (this.selectedChar != null)
            {
                this.selectedChar.selected = false;
                this.selectedChar = null;
            }
            var _loc_1:* = 0;
            while (_loc_1 < this.CharViewCount)
            {
                
                _loc_2 = _loc_1 + this.currentView * this.CharViewCount;
                if (_loc_2 >= this.charData.length)
                {
                    this.UpdateChar(_loc_2, null);
                }
                else
                {
                    this.UpdateChar(_loc_2, this.charData[_loc_2]);
                }
                if (_loc_2 % this.CharViewCount == 0)
                {
                    this.SelectChar(this.mcChar1);
                }
                _loc_1++;
            }
            return;
        }// end function

        public function AddTraningList(param1:Object) : void
        {
            var _loc_2:* = uint(param1.charNum);
            if (this.charTrainingData[_loc_2] == null)
            {
                this.charTrainingData[_loc_2] = new Array();
            }
            var _loc_3:* = false;
            var _loc_4:* = this.charTrainingData[_loc_2];
            var _loc_5:* = 0;
            while (_loc_5 < _loc_4.length)
            {
                
                if (param1.index == _loc_4[_loc_5].index)
                {
                    _loc_4[_loc_5] = param1;
                    _loc_3 = true;
                    break;
                }
                _loc_5++;
            }
            if (_loc_3 == false)
            {
                _loc_4.push(param1);
            }
            if (this.selectedChar == null)
            {
                return;
            }
            if (this.selectedChar.charNum != _loc_2)
            {
                return;
            }
            _loc_4.sortOn("index", Array.NUMERIC);
            this.list.dataProvider = new DataProvider(_loc_4);
            return;
        }// end function

        public function ClearTrainingList() : void
        {
            this.list.dataProvider = new DataProvider();
            return;
        }// end function

        public function UpdateTrainingList() : void
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_12:* = null;
            var _loc_13:* = null;
            var _loc_14:* = 0;
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            var _loc_3:* = null;
            _loc_1 = 0;
            while (_loc_1 < this.charData.length)
            {
                
                if (this.charData[_loc_1].charNum == this.selectedChar.charNum)
                {
                    _loc_2 = _loc_1;
                    _loc_3 = this.charData[_loc_1];
                    _loc_3.trainingCount = 0;
                    _loc_3.completeTrainingCount = 0;
                    break;
                }
                _loc_1++;
            }
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = this.charTrainingData[this.selectedChar.charNum];
            if (_loc_4 == null)
            {
                return;
            }
            this.list.validateNow();
            _loc_1 = 0;
            while (_loc_1 < _loc_4.length)
            {
                
                _loc_5 = this.list.mcItemRenderer.getChildByName("item" + _loc_1) as MMaskedListItemRenderer;
                if (_loc_5 == null)
                {
                }
                else
                {
                    _loc_6 = _loc_4[_loc_1];
                    _loc_7 = _loc_5.getChildByName("TrMenuIcon") as MovieClip;
                    if (_loc_7 != null)
                    {
                        _loc_13 = "";
                        switch(int(_loc_6.index))
                        {
                            case 0:
                            {
                                _loc_13 = "training0";
                                break;
                            }
                            case 1:
                            {
                                _loc_13 = "training1";
                                break;
                            }
                            case 2:
                            {
                                _loc_13 = "training2";
                                break;
                            }
                            case 3:
                            {
                                _loc_13 = "training3";
                                break;
                            }
                            case 4:
                            {
                                _loc_13 = "training4";
                                break;
                            }
                            case 5:
                            {
                                _loc_13 = "training5";
                                break;
                            }
                            default:
                            {
                                break;
                            }
                        }
                        _loc_7.gotoAndStop(_loc_13);
                    }
                    _loc_8 = _loc_5.getChildByName("TrMenuGauge") as StatusIndicator;
                    if (_loc_8 != null)
                    {
                        _loc_8.maximum = _loc_6.max;
                        _loc_8.value = _loc_6.value;
                        if (int(_loc_6.state) == 1 && _loc_8.maximum > _loc_8.value)
                        {
                            _loc_14 = (_loc_8.maximum - _loc_8.value) * 1000;
                            _loc_8._tween = new Tween(_loc_14, _loc_8, {value:_loc_6.max}, {onComplete:this.onCompleteProgressTimer, onChange:this.onUpdateProgressTimer});
                            _loc_8._tween.data = {index:_loc_1, max:int(_loc_6.max), stamina:int(_loc_6.completeStamina)};
                        }
                    }
                    _loc_9 = _loc_5.getChildByName("TrInfoText1") as TextField;
                    if (_loc_9 != null)
                    {
                        if (_loc_6.index != 0)
                        {
                            _loc_9.visible = false;
                        }
                        else
                        {
                            _loc_9.visible = true;
                            _loc_9.htmlText = _loc_6.rewardText;
                        }
                    }
                    _loc_9 = _loc_5.getChildByName("TrInfoText2") as TextField;
                    if (_loc_9 != null)
                    {
                        if (_loc_6.index != 0)
                        {
                            _loc_9.visible = true;
                            _loc_9.htmlText = _loc_6.rewardText;
                        }
                        else
                        {
                            _loc_9.visible = false;
                        }
                    }
                    _loc_10 = _loc_5.getChildByName("TrRefreshButton") as Button;
                    if (_loc_10 != null)
                    {
                        _loc_10.visible = _loc_6.index != 0;
                        _loc_10.enabled = _loc_6.enableRewardChange != 0;
                        _loc_11 = new Object();
                        _loc_11.index = int(_loc_6.index);
                        _loc_11.charLevel = int(_loc_6.charLevel);
                        _loc_11.charNum = uint(_loc_6.charNum);
                        _loc_10.data = _loc_11;
                        _loc_10.addEventListener(ButtonEvent.CLICK, this.onRefreshReward, false, 0, true);
                    }
                    _loc_12 = _loc_5.getChildByName("TrLock") as UIComponent;
                    if (_loc_12 != null)
                    {
                        _loc_12.visible = _loc_6.isLock == 1;
                    }
                    _loc_10 = _loc_5.getChildByName("TrMenuPlusBtn") as Button;
                    if (_loc_10 != null)
                    {
                        _loc_11 = new Object();
                        _loc_11.charNum = uint(_loc_6.charNum);
                        _loc_11.charLevel = int(_loc_6.charLevel);
                        _loc_11.index = int(_loc_6.index);
                        _loc_11.level = int(_loc_6.level);
                        _loc_10.data = _loc_11;
                        _loc_10.visible = _loc_6.isLock == 0;
                        _loc_10.enabled = _loc_6.enableUpgrade == 1;
                        _loc_10.TooltipHtmlText = _loc_6.upgradeTooltip;
                        _loc_10.addEventListener(ButtonEvent.CLICK, this.onUpdateTraining, false, 0, true);
                    }
                    _loc_10 = _loc_5.getChildByName("BtnTrGo") as Button;
                    if (_loc_10 != null)
                    {
                        _loc_10.removeEventListener(ButtonEvent.CLICK, this.onUpdateTraining);
                        _loc_10.removeEventListener(ButtonEvent.CLICK, this.onTrainingBegin);
                        _loc_10.removeEventListener(ButtonEvent.CLICK, this.onTrainingCompleteImmediately);
                        _loc_10.removeEventListener(ButtonEvent.CLICK, this.onTrainingCompleteReward);
                        _loc_10.htmlLabel = _loc_6.rewardBtnText;
                        _loc_10.enabled = int(_loc_6.rewardBtnEnable) == 1;
                        if (_loc_6.isLock == 1)
                        {
                            _loc_11 = new Object();
                            _loc_11.charNum = uint(_loc_6.charNum);
                            _loc_11.charLevel = int(_loc_6.charLevel);
                            _loc_11.index = int(_loc_6.index);
                            _loc_11.level = int(_loc_6.level);
                            _loc_10.data = _loc_11;
                            _loc_10.addEventListener(ButtonEvent.CLICK, this.onUpdateTraining, false, 0, true);
                        }
                        else
                        {
                            _loc_11 = new Object();
                            _loc_11.charNum = uint(_loc_6.charNum);
                            _loc_11.charLevel = int(_loc_6.charLevel);
                            _loc_11.index = int(_loc_6.index);
                            _loc_11.level = int(_loc_6.level);
                            _loc_11.price = int(_loc_6.price);
                            _loc_10.data = _loc_11;
                            switch(int(_loc_6.state))
                            {
                                case 0:
                                {
                                    _loc_10.addEventListener(ButtonEvent.CLICK, this.onTrainingBegin, false, 0, true);
                                    break;
                                }
                                case 1:
                                {
                                    _loc_10.addEventListener(ButtonEvent.CLICK, this.onTrainingCompleteImmediately, false, 0, true);
                                    if (_loc_6.index != 0)
                                    {
                                        var _loc_15:* = _loc_3;
                                        var _loc_16:* = _loc_3.trainingCount + 1;
                                        _loc_15.trainingCount = _loc_16;
                                    }
                                    break;
                                }
                                case 2:
                                {
                                    _loc_10.addEventListener(ButtonEvent.CLICK, this.onTrainingCompleteReward, false, 0, true);
                                    var _loc_15:* = _loc_3;
                                    var _loc_16:* = _loc_3.completeTrainingCount + 1;
                                    _loc_15.completeTrainingCount = _loc_16;
                                    break;
                                }
                                default:
                                {
                                    break;
                                }
                            }
                        }
                    }
                }
                _loc_1++;
            }
            this.UpdateChar(_loc_2, _loc_3);
            return;
        }// end function

        public function UpdateTraining(param1:Object) : void
        {
            if (this.selectedChar.charNum != uint(param1.charNum))
            {
                return;
            }
            var _loc_2:* = this.charTrainingData[param1.charNum];
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = int(param1.index);
            _loc_2[_loc_3] = param1;
            this.list.dataProvider = new DataProvider(_loc_2);
            this.UpdateTrainingList();
            return;
        }// end function

        public function UpdateLevel(param1:Object) : void
        {
            var _loc_6:* = null;
            if (this.selectedChar.charNum != uint(param1.charNum))
            {
                return;
            }
            var _loc_2:* = this.charTrainingData[param1.charNum];
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = int(param1.index);
            var _loc_4:* = this.list.mcItemRenderer.getChildByName("item" + _loc_3) as MMaskedListItemRenderer;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.getChildByName("textField2") as TextField;
            if (_loc_5 != null)
            {
                _loc_5.text = param1.label2;
            }
            _loc_2[_loc_3].label2 = param1.label2;
            _loc_2[_loc_3].level = param1.level;
            _loc_2[_loc_3].upgradeTooltip = param1.upgradeTooltip;
            _loc_2[_loc_3].enableUpgrade = param1.enableUpgrade;
            _loc_4.data.label2 = param1.label2;
            _loc_4.data.level = param1.level;
            _loc_4.data.upgradeTooltip = param1.upgradeTooltip;
            _loc_4.data.enableUpgrade = param1.enableUpgrade;
            this.UpdateTrainingList();
            if (stage != null)
            {
                _loc_6 = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
                _loc_6.localX = this.x;
                _loc_6.localY = this.y;
                _loc_6.component = this;
                stage.dispatchEvent(_loc_6);
            }
            return;
        }// end function

        public function UpdateTriningProgressText(param1:Object) : void
        {
            var _loc_2:* = int(param1.index);
            var _loc_3:* = this.list.mcItemRenderer.getChildByName("item" + _loc_2) as MMaskedListItemRenderer;
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3.getChildByName("textField3") as TextField;
            if (_loc_4 != null)
            {
                _loc_4.text = param1.text;
            }
            _loc_3.data["label3"] = param1.text;
            this.list.dataProvider[_loc_2]["label3"] = param1.text;
            return;
        }// end function

        public function UpdateStamina(param1:Object) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.charData.length)
            {
                
                if (this.charData[_loc_2].charNum == param1.charNum)
                {
                    this.charData[_loc_2]["stamina"] = param1.stamina;
                    this.UpdateChar(_loc_2, this.charData[_loc_2]);
                    break;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function UpdateMaxStamina(param1:Object) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.charData.length)
            {
                
                if (this.charData[_loc_2].charNum == param1.charNum)
                {
                    this.charData[_loc_2]["maxStamina"] = param1.maxStamina;
                    this.UpdateChar(_loc_2, this.charData[_loc_2]);
                    break;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function ForceCharSelect(param1:String) : void
        {
            var _loc_4:* = null;
            this.selectedChar.selected = false;
            var _loc_2:* = uint(param1);
            var _loc_3:* = 1;
            while (_loc_3 <= this.CharViewCount)
            {
                
                _loc_4 = getChildByName("mcChar" + _loc_3) as MovieClip;
                if (_loc_4 == null)
                {
                }
                else
                {
                    _loc_4.selected = false;
                    if (_loc_4.charNum == _loc_2)
                    {
                        _loc_4.selected = true;
                        this.selectedChar = _loc_4;
                        break;
                    }
                }
                _loc_3++;
            }
            return;
        }// end function

        public function RefreshTrainingInfo() : void
        {
            this.SelectChar(this.selectedChar);
            return;
        }// end function

        public function RefreshTraining_CompleteWait0(param1:String) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_2:* = uint(param1);
            if (this.selectedChar.charNum != _loc_2)
            {
                return;
            }
            var _loc_3:* = this.charTrainingData[_loc_2];
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3.length)
            {
                
                _loc_5 = _loc_3[_loc_4];
                if (_loc_5.index == 0)
                {
                    _loc_6 = this.list.mcItemRenderer.getChildByName("item" + _loc_4) as MMaskedListItemRenderer;
                    if (_loc_6 == null)
                    {
                    }
                    else
                    {
                        _loc_7 = _loc_6.getChildByName("TrMenuGauge") as StatusIndicator;
                        if (_loc_7 != null)
                        {
                            if (_loc_7.maximum <= _loc_7.value)
                            {
                                this.RefreshTrainingInfo();
                                break;
                            }
                        }
                    }
                }
                _loc_4++;
            }
            return;
        }// end function

        public function SetCompleteBtnText(param1:Object) : void
        {
            var _loc_2:* = int(param1.index);
            var _loc_3:* = this.list.mcItemRenderer.getChildByName("item" + _loc_2) as MMaskedListItemRenderer;
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3.getChildByName("BtnTrGo") as Button;
            if (_loc_4 != null)
            {
                _loc_4.htmlLabel = param1.text;
            }
            return;
        }// end function

        public function UpdateCharLevel(param1:Object) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.charData.length)
            {
                
                if (this.charData[_loc_2].charNum == param1.charNum)
                {
                    this.charData[_loc_2]["charLevel"] = param1.level;
                    this.UpdateChar(_loc_2, this.charData[_loc_2]);
                    break;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function onRefreshReward(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [_loc_2.data.charNum, _loc_2.data.charLevel, _loc_2.data.index];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_RefreshReward", _loc_3, _loc_4);
            return;
        }// end function

        public function onUpdateTraining(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [_loc_2.data.charNum, _loc_2.data.charLevel, _loc_2.data.index, _loc_2.data.level];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_UpgradeTraining", _loc_3, _loc_4);
            return;
        }// end function

        public function onTrainingBegin(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [_loc_2.data.charNum, _loc_2.data.index, _loc_2.data.level, _loc_2.data.price];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_BeginTraining", _loc_3, _loc_4);
            return;
        }// end function

        public function onTrainingCompleteImmediately(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [_loc_2.data.charNum, _loc_2.data.index, _loc_2.data.charLevel, _loc_2.data.price];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_CompleteImmediatelyTraining", _loc_3, _loc_4);
            return;
        }// end function

        public function onTrainingCompleteReward(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [_loc_2.data.charNum, _loc_2.data.index, _loc_2.data.charLevel];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_RewardTraining", _loc_3, _loc_4);
            return;
        }// end function

        public function onUpdateProgressTimer(param1:Tween) : void
        {
            var _loc_2:* = param1.target as StatusIndicator;
            var _loc_3:* = [Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [param1.data.index, param1.data.max, int(_loc_2.value), param1.data.stamina];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_UpdateProgressTimer", _loc_3, _loc_4);
            var _loc_5:* = this.charTrainingData[this.selectedChar.charNum];
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = _loc_5[param1.data.index];
            if (_loc_6 == null)
            {
                return;
            }
            _loc_6.value = _loc_2.value;
            return;
        }// end function

        public function onCompleteProgressTimer(param1:Tween) : void
        {
            Tween.removeTween(param1);
            if (this.selectedChar == null)
            {
                return;
            }
            var _loc_2:* = [Util.OBJ_TYPE_UINT];
            var _loc_3:* = [this.selectedChar.charNum];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Tr_SelectChar", _loc_2, _loc_3);
            return;
        }// end function

        function __setProp_TrTipScrollBar_TrainingPage_bg_0()
        {
            try
            {
                this.TrTipScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TrTipScrollBar.enabled = true;
            this.TrTipScrollBar.minThumbSize = 10;
            this.TrTipScrollBar.offsetBottom = 0;
            this.TrTipScrollBar.offsetTop = 0;
            this.TrTipScrollBar.scrollTarget = "TrTip";
            this.TrTipScrollBar.trackMode = "scrollPage";
            this.TrTipScrollBar.visible = true;
            try
            {
                this.TrTipScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_TrainingPage_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "TrainingQuestSlot";
            this.list.itemRendererOffset = {x:5, y:1};
            this.list.maskHeight = -1;
            this.list.maskWidth = -1;
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 5;
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
            this.charData = [];
            this.currentView = 0;
            this.charTrainingData = new Dictionary();
            this.selectedChar = null;
            this.mcChar1.visible = false;
            this.mcChar2.visible = false;
            this.mcChar3.visible = false;
            this.mcChar4.visible = false;
            this.mcChar5.visible = false;
            this.mcChar6.visible = false;
            this.mcChar1.mouseChildren = false;
            this.mcChar2.mouseChildren = false;
            this.mcChar3.mouseChildren = false;
            this.mcChar4.mouseChildren = false;
            this.mcChar5.mouseChildren = false;
            this.mcChar6.mouseChildren = false;
            this.mcChar1.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.mcChar2.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.mcChar3.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.mcChar4.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.mcChar5.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.mcChar6.addEventListener(MouseEvent.CLICK, this.onClickChar, false, 0, true);
            this.BtnTrLeft.enabled = false;
            this.BtnTrRight.enabled = false;
            this.BtnTrLeft.addEventListener(ButtonEvent.CLICK, this.onViewLeft, false, 0, true);
            this.BtnTrRight.addEventListener(ButtonEvent.CLICK, this.onViewRight, false, 0, true);
            return;
        }// end function

    }
}
