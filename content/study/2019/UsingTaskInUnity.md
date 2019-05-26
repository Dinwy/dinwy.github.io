+++
title = "Using Task In Unity"
date = 2019-05-17T18:53:02+09:00
tags = ["unity"]
categories = "study"
+++

<div class="description">
## Preface

I was trying make a simple vfx and wondering how to update model without using `Monobehaviour` `Update()` function.

<video playsinline autoplay muted loop id="vid" src="/video/unity/vfx_jumpingWolf.webm" type="video/webm">

If you watch the video carefully model's `scale` has been changed repeatedly. 

Basically by passing `cancellationToken` we can run a async task and able to stop it.

```cs
	public void SpawnAndPlay(Transform pos)
	{
		GameObject.Instantiate(ParticleEffect, pos);
		cts = new CancellationTokenSource();
		CancellationToken ct = cts.Token;

		ModelAnimation(pos, ct);
	}

	public async void ModelAnimation(Transform pos, CancellationToken ct)
	{
		await Task.Delay(TimeSpan.FromSeconds(6));
		var go = GameObject.Instantiate(Model, pos);
		cat = go;

		while (!ct.IsCancellationRequested)
		{
			await Task.Delay(TimeSpan.FromSeconds(.2f), ct);

			if (!ct.IsCancellationRequested) ScaleUP(go, ct);
		}

		await Task.Delay(TimeSpan.FromSeconds(2));
	}

	private void ScaleUP(GameObject go, CancellationToken ct)
	{
		go.transform.localScale += (new Vector3(1, 1, 1) / 2f);

		if (go.transform.localScale.x >= 5)
		{
			cts.Cancel();
		}
	}

```

In the code above, we will scale up the model every `.2f` and when the `localScale.x` reaches 5, cancellation token will be called.

By doing this we don't need to use `Update()`

## Source From

- https://stackoverflow.com/questions/4890915/is-there-a-task-based-replacement-for-system-threading-timer/23814733#23814733

## Summary

## Nomenclature

