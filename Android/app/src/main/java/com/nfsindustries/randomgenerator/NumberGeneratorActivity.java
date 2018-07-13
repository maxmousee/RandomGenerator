package com.nfsindustries.randomgenerator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.TextView;

import java.util.Set;

public class NumberGeneratorActivity extends AppCompatActivity {
    private TextView generatedNumbersTextView;
    private TextView generatedStringTextView;
    private LuckyRandomGenerator generator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_number_generator);
        setUpViews();
        animateViews();
        final String locale = this.getResources().getConfiguration().locale.getCountry();
        generator = new LuckyRandomGenerator(locale);
        generateRandom();
    }

    private void generateRandom() {
        final Set<Integer> tickets = generator.generateLotteryTickets(6);
        generatedNumbersTextView.setText(tickets.toString());
        generatedStringTextView.setText(generator.generateRandomString(8));
    }

    private void setUpViews() {
        generatedNumbersTextView = findViewById(R.id.generatedNumbersTextView);
        generatedStringTextView = findViewById(R.id.generatedStringTextView);
        final Button regenerateButton = findViewById(R.id.regenerateButton);
        regenerateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                generateRandom();
            }
        });
    }

    private void animateViews() {
        final Animation animation =
                AnimationUtils.loadAnimation(getApplicationContext(),
                        R.anim.blink);

        generatedNumbersTextView.startAnimation(animation);
        generatedStringTextView.startAnimation(animation);
    }
}
