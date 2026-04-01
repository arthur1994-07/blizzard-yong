package ActivityRecord_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.core.*;
    import ran.ui.slot.*;
    import ran.ui.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;

    dynamic public class RankingPage_14 extends MovieClip
    {
        public var charList4:MaskedListRanking;
        public var clubList1:MaskedListRanking;
        public var charList1:MaskedListRanking;
        public var charList3:MaskedListRanking;
        public var clubList2:MaskedListRanking;
        public var charList2:MaskedListRanking;
        public var tfRankingInfo:TextField;
        public var RkPowerPlayer:RadioButton;
        public var RkPowerClub:RadioButton;
        public var RkPvp:RadioButton;
        public var RkExpPlayer:RadioButton;
        public var RkTimePlayer:RadioButton;
        public var RkTimeClub:RadioButton;
        public var BtnRkRewardGet:Button;
        public var slotReward1:Slot;
        public var slotReward2:Slot;
        public var slotReward3:Slot;
        public var slotReward4:Slot;
        public var slotReward5:Slot;
        public var TextPowerPlayer:Label;
        public var TextPowerClub:Label;
        public var TextPvp:Label;
        public var TextExpPlayer:Label;
        public var TextTimePlayer:Label;
        public var TextTimeClub:Label;
        public var TextTilteReward:Label;
        public var TextRewardGaugeInfo:Label;
        public var TextRewardGet:Label;
        public var TextRank1:Label;
        public var TextRank2:Label;
        public var TextRank3:Label;
        public var TextRank4:Label;
        public var TextRank5:Label;
        public var RkInfoListScrollBar:ScrollBar;
        public var RewardGauge:StatusIndicator;
        public var ClubrRankingTrophy:MovieClip;
        public var PlayerRankingTrophy:MovieClip;
        public var clubList:MMaskedList;
        public var charList:MMaskedList;
        public var mcRankPlayerInfo:MovieClip;
        public var mcRankClubInfo:MovieClip;
        public var TriangleGauge:MovieClip;
        public const EView_PowerPC:int = 0;
        public const EView_PowerClub:int = 1;
        public const EView_Confront:int = 2;
        public const EView_Exp:int = 3;
        public const EView_TimePC:int = 4;
        public const EView_TimeClub:int = 5;
        public const EView_Size:int = 6;
        public var curViewType:int;
        public var listData:Dictionary;

        public function RankingPage_14()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_RkInfoListScrollBar_RankingPage_bg_0();
            this.__setProp_RkPowerPlayer_RankingPage_text_0();
            this.__setProp_RkPowerClub_RankingPage_text_0();
            this.__setProp_RkPvp_RankingPage_text_0();
            this.__setProp_RkExpPlayer_RankingPage_text_0();
            this.__setProp_RkTimePlayer_RankingPage_text_0();
            this.__setProp_RkTimeClub_RankingPage_text_0();
            this.__setProp_TextRewardGaugeInfo_RankingPage_reward_0();
            this.__setProp_TextRank1_RankingPage_reward_0();
            this.__setProp_TextRank3_RankingPage_reward_0();
            this.__setProp_TextRank4_RankingPage_reward_0();
            this.__setProp_TextRank2_RankingPage_reward_0();
            this.__setProp_TextRank5_RankingPage_reward_0();
            this.__setProp_charList1_RankingPage_PlayerRankingList_0();
            this.__setProp_charList2_RankingPage_PlayerRankingList_0();
            this.__setProp_charList3_RankingPage_PlayerRankingList_0();
            this.__setProp_charList4_RankingPage_PlayerRankingList_0();
            this.__setProp_clubList1_RankingPage_ClubRankingList_0();
            this.__setProp_clubList2_RankingPage_ClubRankingList_0();
            return;
        }// end function

        public function onEnter(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnter);
            this.charList1.visible = true;
            this.charList2.visible = false;
            this.charList3.visible = false;
            this.charList4.visible = false;
            this.clubList1.visible = false;
            this.clubList2.visible = false;
            this.RkPowerPlayer.selected = true;
            this.RkPowerPlayer.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.TextPowerClub.visible = false;
            this.RkPowerClub.visible = false;
            this.RkPowerClub.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.TextPvp.visible = false;
            this.RkPvp.visible = false;
            this.RkPvp.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.TextExpPlayer.visible = false;
            this.RkExpPlayer.visible = false;
            this.RkExpPlayer.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.TextTimePlayer.visible = false;
            this.RkTimePlayer.visible = false;
            this.RkTimePlayer.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.TextTimeClub.visible = false;
            this.RkTimeClub.visible = false;
            this.RkTimeClub.addEventListener(ButtonEvent.CLICK, this.onCategoryChange, false, 0, true);
            this.BtnRkRewardGet.addEventListener(ButtonEvent.CLICK, this.onClickReward, false, 0, true);
            this.CategoryChange(this.EView_PowerPC);
            return;
        }// end function

        public function onCategoryChange(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as RadioButton;
            this.CategoryChange(_loc_2.data.index);
            return;
        }// end function

        public function CategoryChange(param1:int) : void
        {
            this.curViewType = param1;
            var _loc_2:* = [Util.OBJ_TYPE_INT];
            var _loc_3:* = [this.curViewType];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Rk_ChangeCategory", _loc_2, _loc_3);
            switch(this.curViewType)
            {
                case this.EView_PowerPC:
                case this.EView_Confront:
                case this.EView_Exp:
                case this.EView_TimePC:
                {
                    this.mcRankPlayerInfo.visible = true;
                    this.mcRankClubInfo.visible = false;
                    break;
                }
                case this.EView_PowerClub:
                case this.EView_TimeClub:
                {
                    this.mcRankPlayerInfo.visible = false;
                    this.mcRankClubInfo.visible = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            switch(this.curViewType)
            {
                case this.EView_PowerPC:
                {
                    this.charList1.visible = true;
                    this.charList2.visible = false;
                    this.charList3.visible = false;
                    this.charList4.visible = false;
                    this.clubList1.visible = false;
                    this.clubList2.visible = false;
                    break;
                }
                case this.EView_Confront:
                {
                    this.charList1.visible = false;
                    this.charList2.visible = true;
                    this.charList3.visible = false;
                    this.charList4.visible = false;
                    this.clubList1.visible = false;
                    this.clubList2.visible = false;
                    break;
                }
                case this.EView_Exp:
                {
                    this.charList1.visible = false;
                    this.charList2.visible = false;
                    this.charList3.visible = true;
                    this.charList4.visible = false;
                    this.clubList1.visible = false;
                    this.clubList2.visible = false;
                    break;
                }
                case this.EView_TimePC:
                {
                    this.charList1.visible = false;
                    this.charList2.visible = false;
                    this.charList3.visible = false;
                    this.charList4.visible = true;
                    this.clubList1.visible = false;
                    this.clubList2.visible = false;
                    break;
                }
                case this.EView_PowerClub:
                {
                    this.charList1.visible = false;
                    this.charList2.visible = false;
                    this.charList3.visible = false;
                    this.charList4.visible = false;
                    this.clubList1.visible = true;
                    this.clubList2.visible = false;
                    break;
                }
                case this.EView_TimeClub:
                {
                    this.charList1.visible = false;
                    this.charList2.visible = false;
                    this.charList3.visible = false;
                    this.charList4.visible = false;
                    this.clubList1.visible = false;
                    this.clubList2.visible = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.UpdateList(_loc_4.toString());
            return;
        }// end function

        public function GetList(param1:int) : MMaskedList
        {
            switch(param1)
            {
                case this.EView_PowerPC:
                {
                    return this.charList1;
                }
                case this.EView_Confront:
                {
                    return this.charList2;
                }
                case this.EView_Exp:
                {
                    return this.charList3;
                }
                case this.EView_TimePC:
                {
                    return this.charList4;
                }
                case this.EView_PowerClub:
                {
                    return this.clubList1;
                }
                case this.EView_TimeClub:
                {
                    return this.clubList2;
                }
                default:
                {
                    break;
                }
            }
            return null;
        }// end function

        public function onClickReward(event:ButtonEvent) : void
        {
            var _loc_2:* = [Util.OBJ_TYPE_INT];
            var _loc_3:* = [this.curViewType];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_Rk_Reward", _loc_2, _loc_3);
            return;
        }// end function

        public function SetCategoryText0(param1:Object) : void
        {
            this.TextPowerPlayer.text = param1.str;
            this.TextPowerPlayer.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkPowerPlayer.data = _loc_2;
            this.RkPowerPlayer.visible = this.TextPowerPlayer.visible;
            return;
        }// end function

        public function SetCategoryText1(param1:Object) : void
        {
            this.TextPowerClub.text = param1.str;
            this.TextPowerClub.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkPowerClub.data = _loc_2;
            this.RkPowerClub.visible = this.TextPowerClub.visible;
            return;
        }// end function

        public function SetCategoryText2(param1:Object) : void
        {
            this.TextPvp.text = param1.str;
            this.TextPvp.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkPvp.data = _loc_2;
            this.RkPvp.visible = this.TextPvp.visible;
            return;
        }// end function

        public function SetCategoryText3(param1:Object) : void
        {
            this.TextExpPlayer.text = param1.str;
            this.TextExpPlayer.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkExpPlayer.data = _loc_2;
            this.RkExpPlayer.visible = this.TextExpPlayer.visible;
            return;
        }// end function

        public function SetCategoryText4(param1:Object) : void
        {
            this.TextTimePlayer.text = param1.str;
            this.TextTimePlayer.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkTimePlayer.data = _loc_2;
            this.RkTimePlayer.visible = this.TextTimePlayer.visible;
            return;
        }// end function

        public function SetCategoryText5(param1:Object) : void
        {
            this.TextTimeClub.text = param1.str;
            this.TextTimeClub.visible = int(param1.visible) == 0 ? (false) : (true);
            var _loc_2:* = new Object();
            _loc_2.index = int(param1.type);
            this.RkTimeClub.data = _loc_2;
            this.RkTimeClub.visible = this.TextTimeClub.visible;
            return;
        }// end function

        public function SetCategoryInfoText(param1:String) : void
        {
            this.tfRankingInfo.text = param1;
            return;
        }// end function

        public function SetStaticText(param1:Object) : void
        {
            this.TextTilteReward.text = param1.reward;
            this.TextRank1.text = param1.topRank1;
            this.TextRank2.text = param1.topRank2;
            this.TextRank3.text = param1.topRank3;
            this.TextRank4.text = param1.topRank4;
            this.TextRank5.text = param1.topRank5;
            this.TextRewardGet.text = param1.rewardGet;
            this.BtnRkRewardGet.label = param1.rewardGenBtn;
            return;
        }// end function

        public function SetPlayerInfoStaticText(param1:Object) : void
        {
            this.mcRankPlayerInfo.TextPlayerMyRanking.text = param1.myRank;
            this.mcRankPlayerInfo.LabelPlayerInfo1.text = param1.highRank;
            this.mcRankPlayerInfo.LabelPlayerInfo2.text = param1.atPoint;
            this.mcRankPlayerInfo.LabelPlayerInfo3.text = param1.dfPoint;
            return;
        }// end function

        public function SetClubInfoStaticText(param1:Object) : void
        {
            this.mcRankClubInfo.TextClubRanking.text = param1.myRank;
            this.mcRankClubInfo.LabelClubInfo1.text = param1.highRank;
            this.mcRankClubInfo.LabelClubInfo2.text = param1.atPoint;
            this.mcRankClubInfo.LabelClubInfo3.text = param1.dfPoint;
            return;
        }// end function

        public function ClearList(param1:String) : void
        {
            var _loc_2:* = int(param1);
            this.listData[_loc_2] = new Array();
            return;
        }// end function

        public function AddList(param1:Object) : void
        {
            var _loc_2:* = int(param1.type);
            var _loc_3:* = this.listData[_loc_2];
            if (_loc_3 == null)
            {
                return;
            }
            _loc_3.push(param1);
            return;
        }// end function

        public function UpdateList(param1:String) : void
        {
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_2:* = int(param1);
            if (this.curViewType != _loc_2)
            {
                return;
            }
            var _loc_3:* = this.GetList(_loc_2);
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = this.listData[_loc_2];
            if (_loc_4 == null)
            {
                return;
            }
            _loc_3.dataProvider = new DataProvider(_loc_4);
            _loc_3.validateNow();
            var _loc_5:* = 0;
            while (_loc_5 < _loc_4.length)
            {
                
                _loc_6 = _loc_3.mcItemRenderer.getChildByName("item" + _loc_5) as MMaskedListItemRenderer;
                if (_loc_6 == null)
                {
                }
                else
                {
                    _loc_7 = _loc_4[_loc_5];
                    _loc_8 = _loc_6.getChildByName("mcTrophy") as MovieClip;
                    if (_loc_8 != null)
                    {
                        switch(int(_loc_7.rank))
                        {
                            case 1:
                            {
                                _loc_9 = "1st";
                                break;
                            }
                            case 2:
                            {
                                _loc_9 = "2nd";
                                break;
                            }
                            case 3:
                            {
                                _loc_9 = "3rd";
                                break;
                            }
                            default:
                            {
                                _loc_9 = "Normal";
                                break;
                                break;
                            }
                        }
                        _loc_8.gotoAndStop(_loc_9);
                    }
                    _loc_8 = _loc_6.getChildByName("mcClassImg") as MovieClip;
                    if (_loc_8 != null)
                    {
                        _loc_9 = "class";
                        switch(int(_loc_7.classIndex))
                        {
                            case 0:
                            case 6:
                            {
                                _loc_9 = _loc_9 + "3";
                                break;
                            }
                            case 1:
                            case 7:
                            {
                                _loc_9 = _loc_9 + "9";
                                break;
                            }
                            case 2:
                            case 8:
                            {
                                _loc_9 = _loc_9 + "1";
                                break;
                            }
                            case 3:
                            case 9:
                            {
                                _loc_9 = _loc_9 + "8";
                                break;
                            }
                            case 4:
                            case 5:
                            {
                                _loc_9 = _loc_9 + "5";
                                break;
                            }
                            case 10:
                            case 11:
                            {
                                _loc_9 = _loc_9 + "7";
                                break;
                            }
                            case 12:
                            case 13:
                            {
                                _loc_9 = _loc_9 + "2";
                                break;
                            }
                            case 14:
                            case 15:
                            {
                                _loc_9 = _loc_9 + "6";
                                break;
                            }
                            case 16:
                            case 17:
                            {
                                _loc_9 = _loc_9 + "1";
                                break;
                            }
                            case 18:
                            case 19:
                            {
                                _loc_9 = _loc_9 + "4";
                                break;
                            }
                            default:
                            {
                                break;
                            }
                        }
                        _loc_8.gotoAndStop(_loc_9);
                    }
                    _loc_8 = _loc_6.getChildByName("rtClubIcon") as MovieClip;
                    if (_loc_8 != null)
                    {
                        _loc_10 = [Util.OBJ_TYPE_UINT, Util.OBJ_TYPE_STRING];
                        _loc_11 = [uint(_loc_7.clubNum), "RankingPage." + _loc_3.name + ".mcItemRenderer.item" + _loc_5 + ".rtClubIcon"];
                        ExternalInterface.call("OnCustomEvent", "ActivityRecord_Rk_UpdateClubIcon", _loc_10, _loc_11);
                    }
                }
                _loc_5++;
            }
            return;
        }// end function

        public function SetPlayerInfo(param1:Object) : void
        {
            var _loc_2:* = null;
            switch(int(param1.rank))
            {
                case 1:
                {
                    _loc_2 = "1st";
                    break;
                }
                case 2:
                {
                    _loc_2 = "2nd";
                    break;
                }
                case 3:
                {
                    _loc_2 = "3rd";
                    break;
                }
                default:
                {
                    _loc_2 = "Normal";
                    break;
                    break;
                }
            }
            this.mcRankPlayerInfo.PlayerRankingTrophy.gotoAndStop(_loc_2);
            switch(this.curViewType)
            {
                case this.EView_PowerPC:
                {
                    this.mcRankPlayerInfo.LabelPlayerInfo2.visible = false;
                    this.mcRankPlayerInfo.LabelPlayerInfo3.visible = false;
                    this.mcRankPlayerInfo.TextPlayerPoint.text = param1.power;
                    this.mcRankPlayerInfo.LabelPlayerInfoValue2.text = "";
                    this.mcRankPlayerInfo.LabelPlayerInfoValue3.text = "";
                    break;
                }
                case this.EView_Confront:
                {
                    this.mcRankPlayerInfo.LabelPlayerInfo2.visible = true;
                    this.mcRankPlayerInfo.LabelPlayerInfo3.visible = true;
                    this.mcRankPlayerInfo.TextPlayerPoint.text = param1.power;
                    this.mcRankPlayerInfo.LabelPlayerInfoValue2.text = param1.atPoint;
                    this.mcRankPlayerInfo.LabelPlayerInfoValue3.text = param1.dfPoint;
                    break;
                }
                case this.EView_Exp:
                case this.EView_TimePC:
                {
                    this.mcRankPlayerInfo.LabelPlayerInfo2.visible = false;
                    this.mcRankPlayerInfo.LabelPlayerInfo3.visible = false;
                    this.mcRankPlayerInfo.TextPlayerPoint.text = param1.atPoint;
                    this.mcRankPlayerInfo.LabelPlayerInfoValue2.text = "";
                    this.mcRankPlayerInfo.LabelPlayerInfoValue3.text = "";
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.mcRankPlayerInfo.TextPlayerName.text = param1.name;
            this.mcRankPlayerInfo.PlayerRankingInfo.text = param1.rankText;
            this.mcRankPlayerInfo.LabelPlayerInfoValue1.text = param1.highRank;
            var _loc_3:* = this.mcRankPlayerInfo.getChildByName("mcClassImg") as MovieClip;
            if (_loc_3 != null)
            {
                _loc_2 = "class";
                switch(int(param1.classIndex))
                {
                    case 0:
                    case 6:
                    {
                        _loc_2 = _loc_2 + "3";
                        break;
                    }
                    case 1:
                    case 7:
                    {
                        _loc_2 = _loc_2 + "9";
                        break;
                    }
                    case 2:
                    case 8:
                    {
                        _loc_2 = _loc_2 + "1";
                        break;
                    }
                    case 3:
                    case 9:
                    {
                        _loc_2 = _loc_2 + "8";
                        break;
                    }
                    case 4:
                    case 5:
                    {
                        _loc_2 = _loc_2 + "5";
                        break;
                    }
                    case 10:
                    case 11:
                    {
                        _loc_2 = _loc_2 + "7";
                        break;
                    }
                    case 12:
                    case 13:
                    {
                        _loc_2 = _loc_2 + "2";
                        break;
                    }
                    case 14:
                    case 15:
                    {
                        _loc_2 = _loc_2 + "6";
                        break;
                    }
                    case 16:
                    case 17:
                    {
                        _loc_2 = _loc_2 + "1";
                        break;
                    }
                    case 18:
                    case 19:
                    {
                        _loc_2 = _loc_2 + "4";
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                _loc_3.gotoAndStop(_loc_2);
            }
            return;
        }// end function

        public function SetClubInfo(param1:Object) : void
        {
            var _loc_2:* = null;
            switch(int(param1.rank))
            {
                case 1:
                {
                    _loc_2 = "1st";
                    break;
                }
                case 2:
                {
                    _loc_2 = "2nd";
                    break;
                }
                case 3:
                {
                    _loc_2 = "3rd";
                    break;
                }
                default:
                {
                    _loc_2 = "Normal";
                    break;
                    break;
                }
            }
            this.mcRankClubInfo.ClubRankingTrophy.gotoAndStop(_loc_2);
            switch(this.curViewType)
            {
                case this.EView_PowerClub:
                {
                    this.mcRankClubInfo.LabelClubInfo2.visible = false;
                    this.mcRankClubInfo.LabelClubInfo3.visible = false;
                    this.mcRankClubInfo.TextClubPoint.text = param1.power;
                    this.mcRankClubInfo.LabelClubInfoValue2.text = "";
                    this.mcRankClubInfo.LabelClubInfoValue3.text = "";
                    break;
                }
                case this.EView_TimeClub:
                {
                    this.mcRankClubInfo.LabelClubInfo2.visible = false;
                    this.mcRankClubInfo.LabelClubInfo3.visible = false;
                    this.mcRankClubInfo.TextClubPoint.text = param1.atPoint;
                    this.mcRankClubInfo.LabelClubInfoValue2.text = "";
                    this.mcRankClubInfo.LabelClubInfoValue3.text = "";
                    break;
                }
                default:
                {
                    break;
                }
            }
            this.mcRankClubInfo.TextClubName.text = param1.name;
            this.mcRankClubInfo.ClubRankingInfo.text = param1.rankText;
            this.mcRankClubInfo.LabelClubInfoValue1.text = param1.highRank;
            return;
        }// end function

        public function SetRewardRemainTime(param1:Object) : void
        {
            this.TextRewardGaugeInfo.text = param1.text;
            this.RewardGauge.maximum = param1.max;
            this.RewardGauge.minimum = param1.min;
            this.RewardGauge.value = param1.value;
            return;
        }// end function

        public function SetEnableReward(param1:String) : void
        {
            var _loc_2:* = int(param1);
            switch(_loc_2)
            {
                case 0:
                {
                    this.BtnRkRewardGet.enabled = true;
                    break;
                }
                default:
                {
                    this.BtnRkRewardGet.enabled = false;
                    break;
                    break;
                }
            }
            return;
        }// end function

        public function SetRankGraph(param1:String) : void
        {
            this.TriangleGauge.gotoAndStop("top" + param1);
            return;
        }// end function

        function __setProp_RkInfoListScrollBar_RankingPage_bg_0()
        {
            try
            {
                this.RkInfoListScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkInfoListScrollBar.enabled = true;
            this.RkInfoListScrollBar.minThumbSize = 10;
            this.RkInfoListScrollBar.offsetBottom = 0;
            this.RkInfoListScrollBar.offsetTop = 0;
            this.RkInfoListScrollBar.scrollTarget = "tfRankingInfo";
            this.RkInfoListScrollBar.trackMode = "scrollPage";
            this.RkInfoListScrollBar.visible = true;
            try
            {
                this.RkInfoListScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkPowerPlayer_RankingPage_text_0()
        {
            try
            {
                this.RkPowerPlayer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkPowerPlayer.autoSize = "none";
            this.RkPowerPlayer.enabled = true;
            this.RkPowerPlayer.focusable = false;
            this.RkPowerPlayer.groupName = "Category";
            this.RkPowerPlayer.label = "";
            this.RkPowerPlayer.overlayAlign = "none";
            this.RkPowerPlayer.overlayImg = "";
            this.RkPowerPlayer.overlayPadding = {x:0, y:0};
            this.RkPowerPlayer.selected = false;
            this.RkPowerPlayer.visible = true;
            try
            {
                this.RkPowerPlayer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkPowerClub_RankingPage_text_0()
        {
            try
            {
                this.RkPowerClub["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkPowerClub.autoSize = "none";
            this.RkPowerClub.enabled = true;
            this.RkPowerClub.focusable = false;
            this.RkPowerClub.groupName = "Category";
            this.RkPowerClub.label = "";
            this.RkPowerClub.overlayAlign = "none";
            this.RkPowerClub.overlayImg = "";
            this.RkPowerClub.overlayPadding = {x:0, y:0};
            this.RkPowerClub.selected = false;
            this.RkPowerClub.visible = true;
            try
            {
                this.RkPowerClub["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkPvp_RankingPage_text_0()
        {
            try
            {
                this.RkPvp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkPvp.autoSize = "none";
            this.RkPvp.enabled = true;
            this.RkPvp.focusable = false;
            this.RkPvp.groupName = "Category";
            this.RkPvp.label = "";
            this.RkPvp.overlayAlign = "none";
            this.RkPvp.overlayImg = "";
            this.RkPvp.overlayPadding = {x:0, y:0};
            this.RkPvp.selected = false;
            this.RkPvp.visible = true;
            try
            {
                this.RkPvp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkExpPlayer_RankingPage_text_0()
        {
            try
            {
                this.RkExpPlayer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkExpPlayer.autoSize = "none";
            this.RkExpPlayer.enabled = true;
            this.RkExpPlayer.focusable = false;
            this.RkExpPlayer.groupName = "Category";
            this.RkExpPlayer.label = "";
            this.RkExpPlayer.overlayAlign = "none";
            this.RkExpPlayer.overlayImg = "";
            this.RkExpPlayer.overlayPadding = {x:0, y:0};
            this.RkExpPlayer.selected = false;
            this.RkExpPlayer.visible = true;
            try
            {
                this.RkExpPlayer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkTimePlayer_RankingPage_text_0()
        {
            try
            {
                this.RkTimePlayer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkTimePlayer.autoSize = "none";
            this.RkTimePlayer.enabled = true;
            this.RkTimePlayer.focusable = false;
            this.RkTimePlayer.groupName = "Category";
            this.RkTimePlayer.label = "";
            this.RkTimePlayer.overlayAlign = "none";
            this.RkTimePlayer.overlayImg = "";
            this.RkTimePlayer.overlayPadding = {x:0, y:0};
            this.RkTimePlayer.selected = false;
            this.RkTimePlayer.visible = true;
            try
            {
                this.RkTimePlayer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RkTimeClub_RankingPage_text_0()
        {
            try
            {
                this.RkTimeClub["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RkTimeClub.autoSize = "none";
            this.RkTimeClub.enabled = true;
            this.RkTimeClub.focusable = false;
            this.RkTimeClub.groupName = "Category";
            this.RkTimeClub.label = "";
            this.RkTimeClub.overlayAlign = "none";
            this.RkTimeClub.overlayImg = "";
            this.RkTimeClub.overlayPadding = {x:0, y:0};
            this.RkTimeClub.selected = false;
            this.RkTimeClub.visible = true;
            try
            {
                this.RkTimeClub["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRewardGaugeInfo_RankingPage_reward_0()
        {
            try
            {
                this.TextRewardGaugeInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRewardGaugeInfo.autoSize = "center";
            this.TextRewardGaugeInfo.autoSizeEnable = false;
            this.TextRewardGaugeInfo.enabled = true;
            this.TextRewardGaugeInfo.text = "";
            this.TextRewardGaugeInfo.visible = true;
            try
            {
                this.TextRewardGaugeInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRank1_RankingPage_reward_0()
        {
            try
            {
                this.TextRank1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRank1.autoSize = "center";
            this.TextRank1.autoSizeEnable = false;
            this.TextRank1.enabled = true;
            this.TextRank1.text = "";
            this.TextRank1.visible = true;
            try
            {
                this.TextRank1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRank3_RankingPage_reward_0()
        {
            try
            {
                this.TextRank3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRank3.autoSize = "center";
            this.TextRank3.autoSizeEnable = false;
            this.TextRank3.enabled = true;
            this.TextRank3.text = "";
            this.TextRank3.visible = true;
            try
            {
                this.TextRank3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRank4_RankingPage_reward_0()
        {
            try
            {
                this.TextRank4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRank4.autoSize = "center";
            this.TextRank4.autoSizeEnable = false;
            this.TextRank4.enabled = true;
            this.TextRank4.text = "";
            this.TextRank4.visible = true;
            try
            {
                this.TextRank4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRank2_RankingPage_reward_0()
        {
            try
            {
                this.TextRank2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRank2.autoSize = "center";
            this.TextRank2.autoSizeEnable = false;
            this.TextRank2.enabled = true;
            this.TextRank2.text = "";
            this.TextRank2.visible = true;
            try
            {
                this.TextRank2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextRank5_RankingPage_reward_0()
        {
            try
            {
                this.TextRank5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextRank5.autoSize = "center";
            this.TextRank5.autoSizeEnable = false;
            this.TextRank5.enabled = true;
            this.TextRank5.text = "";
            this.TextRank5.visible = true;
            try
            {
                this.TextRank5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_charList1_RankingPage_PlayerRankingList_0()
        {
            try
            {
                this.charList1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.charList1.enabled = true;
            this.charList1.itemRendererName = "PlayerRankingList";
            this.charList1.itemRendererOffset = {x:0, y:0};
            this.charList1.maskHeight = -1;
            this.charList1.maskWidth = -1;
            this.charList1.multiSelectable = false;
            this.charList1.rowCount = 1;
            this.charList1.scrollBarName = "NewScrollBar";
            this.charList1.scrollSpeed = 1;
            this.charList1.visible = true;
            try
            {
                this.charList1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_charList2_RankingPage_PlayerRankingList_0()
        {
            try
            {
                this.charList2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.charList2.enabled = true;
            this.charList2.itemRendererName = "PlayerRankingList";
            this.charList2.itemRendererOffset = {x:0, y:0};
            this.charList2.maskHeight = -1;
            this.charList2.maskWidth = -1;
            this.charList2.multiSelectable = false;
            this.charList2.rowCount = 1;
            this.charList2.scrollBarName = "NewScrollBar";
            this.charList2.scrollSpeed = 1;
            this.charList2.visible = true;
            try
            {
                this.charList2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_charList3_RankingPage_PlayerRankingList_0()
        {
            try
            {
                this.charList3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.charList3.enabled = true;
            this.charList3.itemRendererName = "PlayerRankingList";
            this.charList3.itemRendererOffset = {x:0, y:0};
            this.charList3.maskHeight = -1;
            this.charList3.maskWidth = -1;
            this.charList3.multiSelectable = false;
            this.charList3.rowCount = 1;
            this.charList3.scrollBarName = "NewScrollBar";
            this.charList3.scrollSpeed = 1;
            this.charList3.visible = true;
            try
            {
                this.charList3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_charList4_RankingPage_PlayerRankingList_0()
        {
            try
            {
                this.charList4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.charList4.enabled = true;
            this.charList4.itemRendererName = "PlayerRankingList";
            this.charList4.itemRendererOffset = {x:0, y:0};
            this.charList4.maskHeight = -1;
            this.charList4.maskWidth = -1;
            this.charList4.multiSelectable = false;
            this.charList4.rowCount = 1;
            this.charList4.scrollBarName = "NewScrollBar";
            this.charList4.scrollSpeed = 1;
            this.charList4.visible = true;
            try
            {
                this.charList4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_clubList1_RankingPage_ClubRankingList_0()
        {
            try
            {
                this.clubList1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.clubList1.enabled = true;
            this.clubList1.itemRendererName = "ClubRankingList";
            this.clubList1.itemRendererOffset = {x:0, y:0};
            this.clubList1.maskHeight = -1;
            this.clubList1.maskWidth = -1;
            this.clubList1.multiSelectable = false;
            this.clubList1.rowCount = 1;
            this.clubList1.scrollBarName = "NewScrollBar";
            this.clubList1.scrollSpeed = 1;
            this.clubList1.visible = true;
            try
            {
                this.clubList1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_clubList2_RankingPage_ClubRankingList_0()
        {
            try
            {
                this.clubList2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.clubList2.enabled = true;
            this.clubList2.itemRendererName = "ClubRankingList";
            this.clubList2.itemRendererOffset = {x:0, y:0};
            this.clubList2.maskHeight = -1;
            this.clubList2.maskWidth = -1;
            this.clubList2.multiSelectable = false;
            this.clubList2.rowCount = 1;
            this.clubList2.scrollBarName = "NewScrollBar";
            this.clubList2.scrollSpeed = 1;
            this.clubList2.visible = true;
            try
            {
                this.clubList2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.curViewType = this.EView_PowerPC;
            this.listData = new Dictionary();
            addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            return;
        }// end function

    }
}
