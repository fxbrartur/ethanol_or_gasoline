package com.turito.alcorgas.alcohol_or_gasoline

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    public HyBid.initialize("APP_TOKEN", this);

    private val mInterstitial: HyBidInterstitialAd? = null

}

private fun loadInterstitial() {
    mInterstitial = HyBidInterstitialAd(this, "ZONE_ID", object : Listener() {
        @Override
        fun onInterstitialLoaded() {
        }

        @Override
        fun onInterstitialLoadFailed(error: Throwable?) {
        }

        @Override
        fun onInterstitialImpression() {
        }

        @Override
        fun onInterstitialDismissed() {
        }

        @Override
        fun onInterstitialClick() {
        }
    })
    mInterstitial.load()
}

