﻿package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	
	public class YTRLube extends ItemSlotClass
	{
		
		//constructor
		public function YTRLube()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "YT.Lube";
			
			//Regular name
			this.longName = "Yibb-Tstll’s Reflexive Lube";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Yibb-Tstll’s Reflexive Lubricant suppository";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This Camarilla-brand lubricant is applied as a suppository and is supposedly \"Good for What Rails You!\" The small, green capsule bears a picture of a tove with four thumbs up and an unsettling grin across his face. It will help you accommodate larger insertions at your backdoor.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 60;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			//this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You push the small, green capsule into your rear, feeling it slip surprisingly well into your bud. It dissolves instantly, bringing a slippery, lubed feeling to your asshole. That was... weird, but it seems to have worked.");
				if(!target.hasStatusEffect("Anal Lubricant")) target.createStatusEffect("Anal Lubricant",0,0,0,0,false,"Icon_Splatter","Thanks to some YTR Lube, your anus is particularly slippery! ...at least for a while.",false,4320);
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " shoves the pill up " + target.mf("his","her") + " backdoor with an odd expression on " + target.mf("his","her") + " face.");
				if(!target.hasStatusEffect("Anal Lubricant")) target.createStatusEffect("Anal Lubricant",0,0,0,0,false,"Icon_Splatter","Thanks to some YTR Lube, your anus is particularly slippery! ...at least for a while.",false,4320);
			}
			return false;
		}
	}
}
