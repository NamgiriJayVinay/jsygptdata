  <com.google.android.material.textfield.TextInputLayout
        android:id="@+id/personInputLayout"
        android:layout_width="200dp"
        android:layout_height="wrap_content"
        android:hint="Select a Person"
        android:layout_marginTop="25dp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        tools:ignore="MissingConstraints">

        <com.google.android.material.textfield.MaterialAutoCompleteTextView
            android:id="@+id/personDropdown"
            android:layout_width="match_parent"
            android:padding="15dp"
            android:layout_height="wrap_content"
            android:inputType="none" />
    </com.google.android.material.textfield.TextInputLayout>




package com.example.dropdownmaterial;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.textfield.MaterialAutoCompleteTextView;

public class MainActivity extends AppCompatActivity {

    String person;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Reference the MaterialAutoCompleteTextView
        MaterialAutoCompleteTextView personDropdown = findViewById(R.id.personDropdown);

        // Dropdown options
        String[] people = new String[]{"Jay", "Snehith", "Ram", "Sita"};

        // Set up the adapter for the dropdown
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_dropdown_item_1line, people);
        personDropdown.setAdapter(adapter);

        // Show dropdown when the view is clicked
        personDropdown.setOnClickListener(v -> personDropdown.showDropDown());

        // Listen for selection events
        personDropdown.setOnItemClickListener((adapterView, view, position, id) -> {
            // Assign the selected person to the var
            person = (String) adapterView.getItemAtPosition(position);

            // Show a toast with the selected person
            Toast.makeText(MainActivity.this, "Selected person is: " + person, Toast.LENGTH_SHORT).show();
        });
    }
}
